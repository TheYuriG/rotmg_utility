import 'package:rotmg_utility/trading_items.dart';
import 'main.dart';
import 'data.dart';
import 'package:flutter/material.dart';
import 'package:time_formatter/time_formatter.dart';

// ignore: must_be_immutable
class SpecificItem extends StatefulWidget {
  List _imageInfo;
  String _imageLink;
  SpecificItem(this._imageInfo, this._imageLink);
  @override
  _SpecificItemState createState() =>
      _SpecificItemState(_imageInfo, _imageLink);
}

List<int> keys = [];

class _SpecificItemState extends State<SpecificItem> {
  List imageInfo;
  String imageLink;
  _SpecificItemState(this.imageInfo, this.imageLink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(settings.get('primaryColor')),
        centerTitle: true,
        leading: RawMaterialButton(
          child: Icon(
            Icons.arrow_back,
            color: Color(settings.get('secondaryColor')),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: imageInfo[0],
              child: Center(
                child: Tooltip(
                  message: imageInfo[0],
                  child: Container(
                    child: Image.asset(
                      imageInfo[1],
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              imageInfo[0],
              style: TextStyle(
                  color: Color(settings.get('secondaryColor')),
                  fontWeight: FontWeight.bold,
                  fontFamily: "PS2P",
                  fontSize: 12),
            ),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(settings.get('primaryColor')),
          image: DecorationImage(
              image: AssetImage('assets/backgrounds/triangular.png'),
              scale: 2,
              repeat: ImageRepeat.repeat),
        ),
        padding: EdgeInsets.all(0),
        child: FutureBuilder(
            future: retrieveItemOffers(imageLink),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      return snapshot.data[index];
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Color(settings.get('secondaryColor')),
                    strokeWidth: 8,
                  ),
                );
              }
            }),
      ),
    );
  }
}

// This stores all the offers for the given item.
Future<List<Widget>> retrieveItemOffers(String link) async {
  // Essa lista vai guardar todos os widgets que serão renderizados quando você abrir uma oferta.
  List<Widget> offers = [];
  // Esse mapa vai guardar toda a informação organizada que será puxada da página especifica de oferta.
  Map<int, Map<String, dynamic>> condensedOffers = {};

  // print("Loading offer page started");
  if (await webScraper.loadWebPage(link)) {
    // Items que você precisa entregar para fechar negócio
    List offerOut = [];
    webScraper.getElement('table#g > tbody > tr > td:first-child', []).forEach(
      (element) {
        offerOut.add(element['title']
            .replaceAll('×', " ")
            .trim()
            .split(" ")
            .map(int.parse)
            .toList());
      },
    );
    // print("Offer Out numbers: $offerOut");

    // Ids dos items que você precisa entregar para fechar negócio
    List offerOutIds = [];
    webScraper.getElement(
        'table#g > tbody > tr > td:first-child > span.item-static > span.item',
        ['data-item']).forEach(
      (element) {
        offerOutIds.add(element['attributes']['data-item']);
      },
    );
    // print("Out Ids: $offerOutIds");

    // Items que você vai receber ao fechar negócio
    List offerIn = [];
    webScraper.getElement('table#g > tbody > tr > td:nth-child(1)', []).forEach(
      (element) {
        offerIn.add(element['title']
            .replaceAll('×', " ")
            .trim()
            .split(" ")
            .map(int.parse)
            .toList());
      },
    );
    // print("In numbers: $offerIn");

    // Ids dos items que você vao receber ao fechar negócio
    List offerInIds = [];
    webScraper.getElement(
        'table#g > tbody > tr > td:nth-child(1) > span.item-static  > span.item',
        ['data-item']).forEach(
      (element) {
        offerInIds.add(element['attributes']['data-item']);
      },
    );
    // print("In Ids $offerInIds");

    // data de quando a oferta foi postada
    final List<Map<String, dynamic>> offerWhen = webScraper.getElement(
        'table#g > tbody > tr > td:nth-child(3) > span.timeago', []);
    // print(offerWhen);

    // Nome do usuário que fez a oferta
    final List<Map<String, dynamic>> offerUser =
        webScraper.getElement('table#g > tbody > tr > td:nth-child(5)', []);
    // print(offerUser);

    // Última vez que esse usuário foi visto, caso ele tenha essa opção de privacidade livre
    final List<Map<String, dynamic>> offerLastSeen =
        webScraper.getElement('table#g > tbody > tr > td:nth-child(6)', []);
    // print(offerLastSeen);

    // Último servidor que esse usuário foi visto, caso ele tenha essa opção de privacidade livre
    final List<Map<String, dynamic>> offerServer =
        webScraper.getElement('table#g > tbody > tr > td:nth-child(7)', []);
    // print(offerServer);

    // print(allOffers);

    // Esse for loop vai retirar os usuários de offerUser, os servidores de offerServer,
    // a data da oferta de offerWhen e última visualização de offerLastSeen
    // e organizar eles no objeto consensedOffers;
    for (var i = 0; i < offerUser.length; i++) {
      condensedOffers.addAll({
        i: {'user': offerUser[i]['title'], "skip": false}
      });
      // print("fetching last seen");
      DateTime seen = DateTime(0);
      if (offerLastSeen[i]['title'] != "hidden") {
        seen = DateTime.parse(offerLastSeen[i]['title']);
      }
      // print("fetching when offer was posted");
      DateTime when = DateTime(0);
      if (offerWhen[i]['title'] != "") {
        when = DateTime.parse(offerWhen[i]['title']);
      }
      if (seen.isAfter(when)) {
        condensedOffers[i]['time'] = seen.millisecondsSinceEpoch;
      } else {
        condensedOffers[i]['time'] = when.millisecondsSinceEpoch;
      }

      // print("fetching servers");
      if (offerServer[i]['title'] != "") {
        condensedOffers[i]['server'] = offerServer[i]['title'];
      } else {
        condensedOffers[i]['server'] = null;
      }
      condensedOffers[i]['offerOut'] = offerOut[i];
      condensedOffers[i]['offerIn'] = offerIn[i];
      if (offerOut[i].reduce((a, b) => a + b) > 8 ||
          offerIn[i].reduce((a, b) => a + b) > 8) {
        print(
            "The #$i position item is getting removed due to having too many items.");
        condensedOffers[i]['skip'] = true;
      }
    }

    // Esse for in loop vai retirar os items oferecidos e
    // suas IDs de offerOut e offerOutID e organizar eles no objeto consensedOffers;
    int j = 0;
    for (var l = 0; l < offerOut.length; l++) {
      List outList = [];
      for (var k = 0; k < offerOut[l].length; k++) {
        if (!allOffers.containsKey(int.parse(offerOutIds[j]))) {
          condensedOffers[l]['skip'] = true;
        }
        outList.add(int.parse(offerOutIds[j]));
        j++;
      }
      condensedOffers[l]['offerOutIds'] = outList;
    }
    // Esse for in loop vai retirar os items oferecidos e
    // suas IDs de offerIn e offerInId e organizar eles no objeto consensedOffers;
    j = 0;
    for (var l = 0; l < offerIn.length; l++) {
      List inList = [];
      // ignore: unused_local_variable
      for (int k in offerIn[l]) {
        if (!allOffers.containsKey(int.parse(offerInIds[j]))) {
          condensedOffers[l]['skip'] = true;
        }
        inList.add(int.parse(offerInIds[j]));
        j++;
      }
      condensedOffers[l]['offerInIds'] = inList;
    }

    // Essa variavel é definida quando a classe é construída e ela guarda a
    // a ordem dos items organizados por tempo de postagem.
    // Essa variavel é depois usada para renderizar os objetos nessa ordem também,
    // através de keys[i]
    keys = condensedOffers.keys.toList();
    keys.sort((k1, k2) =>
        (condensedOffers[k2]['time'] - condensedOffers[k1]['time']));
  }

  // print(condensedOffers);
  if (keys.isNotEmpty) {
    // print(allOffers);
    for (var i = 0; i < keys.length; i++) {
      if (!condensedOffers[keys[i]]['skip'] &&
          condensedOffers[keys[i]]['offerOut'].length < 5 &&
          condensedOffers[keys[i]]['offerIn'].length < 5) {
        offers.add(Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 3, color: Color(settings.get('secondaryColor'))),
              color: settings.get('whiteTheme') == true
                  ? Colors.blue[200]
                  : Colors.grey[900],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                    color: Color(settings.get('secondaryColor')),
                    offset: Offset(2, 2),
                    blurRadius: 2)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${condensedOffers[keys[i]]['user']}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "PS2P",
                    fontSize: 10,
                    color: Color(settings.get('secondaryColor'))),
              ),
              if (condensedOffers[keys[i]]['server'] != null)
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "at ${condensedOffers[keys[i]]['server']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "PS2P",
                        fontSize: 10,
                        color: Color(settings.get('secondaryColor'))),
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 0)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerOutIds'][0]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerOutIds']
                                [0]]['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 0)
                        Container(
                          width: 10,
                          child: Text(
                            "${condensedOffers[keys[i]]['offerOut'][0].toString()}x",
                            style: TextStyle(
                                fontFamily: "PS2P",
                                fontSize: 8,
                                color: Color(settings.get('secondaryColor'))),
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 1)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerOutIds'][1]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerOutIds']
                                [1]]['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 1)
                        Container(
                          width: 10,
                          child: Text(
                            "${condensedOffers[keys[i]]['offerOut'][1].toString()}x",
                            style: TextStyle(
                                fontFamily: "PS2P",
                                fontSize: 8,
                                color: Color(settings.get('secondaryColor'))),
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 2)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerOutIds'][2]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerOutIds']
                                [2]]['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 2)
                        Container(
                          width: 10,
                          child: Text(
                            "${condensedOffers[keys[i]]['offerOut'][2].toString()}x",
                            style: TextStyle(
                                fontFamily: "PS2P",
                                fontSize: 8,
                                color: Color(settings.get('secondaryColor'))),
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 3)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerOutIds'][3]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerOutIds']
                                [3]]['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerOutIds'].length > 3)
                        Container(
                          width: 10,
                          child: Text(
                            "${condensedOffers[keys[i]]['offerOut'][3].toString()}x",
                            style: TextStyle(
                                fontFamily: "PS2P",
                                fontSize: 8,
                                color: Color(settings.get('secondaryColor'))),
                          ),
                        ),
                    ],
                  ),
                  Tooltip(
                    message: 'Trade ← for →',
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Color(settings.get('secondaryColor')),
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      if (condensedOffers[keys[i]]['offerInIds'].length > 0)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerInIds'][0]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerInIds'][0]]
                                ['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerIn'].length > 0)
                        Container(
                          width: 10,
                          child: Text(
                            "${condensedOffers[keys[i]]['offerIn'][0].toString()}x",
                            style: TextStyle(
                                fontFamily: "PS2P",
                                fontSize: 8,
                                color: Color(settings.get('secondaryColor'))),
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerInIds'].length > 1)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerInIds'][1]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerInIds'][1]]
                                ['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerIn'].length > 1)
                        Container(
                          width: 10,
                          child: Text(
                            "${condensedOffers[keys[i]]['offerIn'][1].toString()}x",
                            style: TextStyle(
                                fontFamily: "PS2P",
                                fontSize: 8,
                                color: Color(settings.get('secondaryColor'))),
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerInIds'].length > 2)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerInIds'][2]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerInIds'][2]]
                                ['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerIn'].length > 2)
                        Text(
                          "${condensedOffers[keys[i]]['offerIn'][2].toString()}x",
                          style: TextStyle(
                              fontFamily: "PS2P",
                              fontSize: 8,
                              color: Color(settings.get('secondaryColor'))),
                        ),
                      if (condensedOffers[keys[i]]['offerInIds'].length > 3)
                        Tooltip(
                          message: allOffers[condensedOffers[keys[i]]
                              ['offerInIds'][3]]['name'],
                          child: Image.asset(
                            allOffers[condensedOffers[keys[i]]['offerInIds'][3]]
                                ['imageLocation'],
                            width: 30,
                            height: 30,
                          ),
                        ),
                      if (condensedOffers[keys[i]]['offerIn'].length > 3)
                        Container(
                          width: 10,
                          child: Text(
                            "${condensedOffers[keys[i]]['offerIn'][3].toString()}x",
                            style: TextStyle(
                                fontFamily: "PS2P",
                                fontSize: 8,
                                color: Color(settings.get('secondaryColor'))),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Tooltip(
                message:
                    "This considers the closest time between player's last seen timestamp (if avaiable) and offer posting timestamp.\nBy default, RealmEye displays offers by post time that while often proven useful, tends to be irrelevant if the user went offline since.\nBy using this medium, we intend to reduce in-game failed messaging as much as possible.",
                child: Text(
                  formatTime(condensedOffers[keys[i]]['time']),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "PS2P",
                      fontSize: 10,
                      color: Color(settings.get('secondaryColor'))),
                ),
              ),
            ],
          ),
        ));
      }
    }

    return [
      Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        children: offers,
      )
    ];
  }
  return [
    Center(
      child: Container(
        child: Text(
          "No offers here!",
          style: TextStyle(
              color: Color(settings.get('secondaryColor')),
              fontSize: 15,
              fontFamily: "P2SP"),
        ),
      ),
    )
  ];
}
