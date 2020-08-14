import 'main.dart';
import 'data.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:time_formatter/time_formatter.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  List _imageInfo;
  String _imageLink;
  DetailScreen(this._imageInfo, this._imageLink);
  @override
  _DetailScreenState createState() =>
      _DetailScreenState(_imageInfo, _imageLink);
}

List<int> keys = [];

class _DetailScreenState extends State<DetailScreen> {
  List imageInfo;
  String imageLink;
  _DetailScreenState(this.imageInfo, this.imageLink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: RawMaterialButton(
          child: Icon(
            Icons.arrow_back,
            color: settings['secondaryColor'],
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  color: settings['secondaryColor'],
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
          color: settings['primaryColor'],
          image: DecorationImage(
              image: AssetImage('assets/backgrounds/triangular.png'),
              scale: 2,
              repeat: ImageRepeat.repeat),
        ),
        padding: EdgeInsets.all(20),
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
                return Center(child: CircularProgressIndicator());
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
    final List<Map<String, dynamic>> offerOut =
        webScraper.getElement('table#g > tbody > tr > td:first-child', []);
    // print(offerOut);
    // print(offerOut.length);

    // Ids dos items que você precisa entregar para fechar negócio
    final List<Map<String, dynamic>> offerOutIds = webScraper.getElement(
        'table#g > tbody > tr > td:first-child > span.item-static > span.item',
        ['data-item']);
    // print("Offer Out ids: $offerOutIds");
    // print("Offer Out ids length: ${offerOutIds.length}");

    // Items que você vai receber ao fechar negócio
    final List<Map<String, dynamic>> offerIn =
        webScraper.getElement('table#g > tbody > tr > td:nth-child(1)', []);
    // print(offerIn);

    // Ids dos items que você vao receber ao fechar negócio
    final List<Map<String, dynamic>> offerInIds = webScraper.getElement(
        'table#g > tbody > tr > td:nth-child(1) > span.item-static  > span.item',
        ['data-item']);
    // print(offerInIds);

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

    // Esse for loop vai retirar os usuários de offerUser, os servidores de offerServer,
    // a data da oferta de offerWhen e última visualização de offerLastSeen
    // e organizar eles no objeto consensedOffers;
    for (var i = 0; i < offerUser.length; i++) {
      // print("fetching users");
      condensedOffers.addAll({
        i: {'user': offerUser[i]['title']}
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
    }

    // Esse for in loop vai retirar os items oferecidos e
    // suas IDs de offerOut e offerOutID e organizar eles no objeto consensedOffers;
    int j = 0;
    for (var i = 0; i < offerOut.length; i++) {
      List<String> outList = offerOut[i]['title'].split("×");
      condensedOffers[i]['offerOut'] = {};
      for (var k = 1; k < outList.length; k++) {
        condensedOffers[i]['offerOut']
            [offerOutIds[j]['attributes']['data-item']] = outList[k];
        j++;
      }
    }

    // Esse for in loop vai retirar os items oferecidos e
    // suas IDs de offerIn e offerInId e organizar eles no objeto consensedOffers;
    j = 0;
    for (var i = 0; i < offerIn.length; i++) {
      List<String> inList = offerIn[i]['title'].split("×");
      condensedOffers[i]['offerIn'] = {};
      for (var k = 1; k < inList.length; k++) {
        condensedOffers[i]['offerIn']
            [offerInIds[j]['attributes']['data-item']] = inList[k];
        j++;
      }

      // Essa variavel é difinida quando a classe é construída e ela guarda a
      // a ordem dos items organizados por tempo de postagem.
      // Essa variavel é depois usada para renderizar os objetos nessa ordem também,
      // através de keys[i]
      keys = condensedOffers.keys.toList();
      keys.sort((k1, k2) =>
          (condensedOffers[k2]['time'] - condensedOffers[k1]['time']));
    }

    // print(condensedOffers);

    for (var i = 0; i < keys.length; i++) {
      offers.add(Container(
        // width: 170,
        // height: 135, //change this value once
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: settings['secondaryColor']),
            color: settings['primaryColor'],
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                  color: settings['secondaryColor'],
                  offset: Offset(2, 2),
                  blurRadius: 2)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${condensedOffers[keys[i]]['user']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "PS2P",
                  fontSize: 10,
                  color: settings['secondaryColor']),
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
                      color: settings['secondaryColor']),
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Tooltip(
                          message: "Potion of Defense",
                          child: Image.asset(
                            "images/pots/defpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Tooltip(
                          message: "Potion of Defense",
                          child: Image.asset(
                            "images/pots/defpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Tooltip(
                          message: "Potion of Defense",
                          child: Image.asset(
                            "images/pots/defpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Tooltip(
                          message: "Potion of Defense",
                          child: Image.asset(
                            "images/pots/defpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Tooltip(
                  message: 'Trade ← for →',
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: settings['secondaryColor'],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Tooltip(
                          message: "Potion of Attack",
                          child: Image.asset(
                            "images/pots/atkpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Tooltip(
                          message: "Potion of Attack",
                          child: Image.asset(
                            "images/pots/atkpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Tooltip(
                          message: "Potion of Attack",
                          child: Image.asset(
                            "images/pots/atkpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Tooltip(
                          message: "Potion of Attack",
                          child: Image.asset(
                            "images/pots/atkpot.png",
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
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
                    color: settings['secondaryColor']),
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
