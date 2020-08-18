import 'package:flutter/material.dart';
import 'data.dart';
import 'main.dart';
import 'package:time_formatter/time_formatter.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

// Essa variável limpa as estatisticas de summaryObject e organiza elas
Map<String, String> summaryData = {};
// Essa variavel guarda a cor da estrela da conta, para fácil acesso em outros locais.
Image starColor;
// Essa variável limpa as estatisticas de charObject e organiza elas
Map<int, Map<String, dynamic>> charData = {};

class _AccountState extends State<Account> {
  Future<List<Widget>> charsList() async {
    List<Widget> chars = [];
    await playerData();

    Padding lastServer(int char) {
      if (charData[char]['server'] != null) {
        return Padding(
          padding: EdgeInsets.all(0),
          child: Text(
            "Server: ${charData[char]['server']}",
            style: TextStyle(
                color: settings['secondaryColor'],
                fontFamily: "PS2P",
                fontSize: 12),
            textAlign: TextAlign.center,
          ),
        );
      } else {
        return Padding(padding: EdgeInsets.all(0));
      }
    }

    for (var k = 0; k < charData.length; k++) {
      chars.add(
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: settings['primaryColor'],
              border: Border.all(width: 3, color: settings['secondaryColor']),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                    color: settings['secondaryColor'],
                    offset: Offset(2, 2),
                    blurRadius: 3)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'images/chars/${await charData[k]['class'].toLowerCase()}.png',
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          await charData[k]['stats']['maxed'],
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          await charData[k]['class'],
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    lastServer(k),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: retrieveStars(await charData[k]['stars'])),
                    Row(
                      children: [
                        Image.asset(
                          'images/fame.png',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${await charData[k]['fame']}",
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return chars;
  }

// Essa função popula a coluna de CQC (Class Quests Completed) do menu de personagem.
  List<Image> retrieveStars(String char) {
    List<Image> classStars = [];
    int stars = int.parse(char[0]);
    for (var i = 0; i < stars; i++) {
      classStars.add(starColor);
    }
    return classStars;
  }

  // Essa função vai calcular as estrelas da sua conta baseada na formula atual que usa 16 personagens, 5 estrelas cada.
// Referência: https://www.realmeye.com/wiki/game-objectives
  Image accountStar() {
    int accountStar = int.parse(summaryData['Rank']);
    String starColor;
    if (accountStar < 16) {
      starColor = 'light_blue.png';
    } else if (accountStar >= 16 && accountStar < 32) {
      starColor = 'dark_blue';
    } else if (accountStar >= 32 && accountStar < 48) {
      starColor = 'red';
    } else if (accountStar >= 48 && accountStar < 64) {
      starColor = 'orange';
    } else if (accountStar >= 64 && accountStar < 80) {
      starColor = 'yellow';
    } else if (accountStar == 80) {
      starColor = "white";
    }
    return Image.asset(
      'images/stars/$starColor.png',
      width: 20,
      height: 20,
    );
  }

  Future<Map<int, Map<String, dynamic>>> playerData() async {
    // Essa variável puxa as informações de perfil e depois salva elas em "summaryData"
    List<Map<String, dynamic>> summaryObject;
    // Essa variável puxa as informações de personagens e depois salva elas em "charData"
    List<Map<String, dynamic>> charObject;
    // Essa variável puxa as informações de estatísticas e depois salva elas em "charData"
    List<Map<String, dynamic>> statsObject;

    // todas as informações são limpas antes de iniciar a função para evitar erros
    // caso o usuário escolha trocar de usuário pra seguir.
    summaryData = {};
    charData = {};

    if (await webScraper.loadWebPage('/player/${settings['playerId']}')) {
      try {
        // Isso "acerta" a ID do jogador com maiúsculas e minusculas, como está no RealmEye.
        webScraper.getElement('h1 > span.entity-name', []).forEach((e) {
          settings['playerId'] = e['title'];
        });
        // Isso puxa informação da conta do usuário acessado.
        summaryObject =
            webScraper.getElement('table.summary > tbody > tr > td', []);
        // Isso puxa a listagem de personagens do jogador escolhido.
        // Ainda é necessário checar caso isso seja invalido (ex: jogador escondeu todos os jogadores).
        charObject = webScraper.getElement(
            'table#e.table.table-striped.tablesorter > tbody > tr > td', []);
        // Isso puxa as informações de estatisticas de todos os personagens.
        // Essa informação é depois agregada no charData.
        statsObject = webScraper.getElement(
            'table#e.table.table-striped.tablesorter > tbody > tr > td > span.player-stats',
            ['data-stats', 'data-bonuses']);

        for (var i = 0; i < summaryObject.length; i++) {
          if (i % 2 == 1) {
            continue;
          } else {
            summaryData.addAll(
                {summaryObject[i]['title']: summaryObject[i + 1]['title']});
          }
        }
        starColor = accountStar();
        if (summaryData['Last seen'] == "hidden") {
          // Essa função puxa informação de personagens de uma conta que tem privacidade ativa.
          // Para esses tipos de conta, não é possível puxar qual o último servidor e hora de login de cada personagem.
          int i = 0;
          for (var j = 0; j < charObject.length / 10; j++) {
            charData.addAll({
              j: {
                'class': charObject[i + 2]['title'],
                'level': charObject[i + 3]['title'],
                'stars': charObject[i + 4]['title'],
                'fame': charObject[i + 5]['title'],
                'stats': {
                  'maxed': charObject[i + 9]['title'],
                  'current': null,
                  'bonuses': null
                },
                'lastSeen': null,
                'server': null
              }
            });
            i += 10;
          }
        } else {
          int i = 0;
          for (var j = 0; j < charObject.length / 12; j++) {
            charData.addAll({
              j: {
                'class': charObject[i + 2]['title'],
                'level': charObject[i + 3]['title'],
                'stars': charObject[i + 4]['title'],
                'fame': charObject[i + 5]['title'],
                'stats': {
                  'maxed': charObject[i + 9]['title'],
                  'current': null,
                  'bonuses': null
                },
                'lastSeen': charObject[i + 10]['title'],
                'server': charObject[i + 11]['title']
              }
            });
            i += 12;
          }
        }
        for (var m = 0; m < statsObject.length; m++) {
          charData[m]['stats']['current'] =
              statsObject[m]['attributes']['data-stats'];
          charData[m]['stats']['bonuses'] =
              statsObject[m]['attributes']['data-bonuses'];
        }
      } catch (e) {
        setState(() {
          settings['playerTracker'] = false;
          settings['playerId'] = null;
        });
      }
    }
    return charData;
  }

// 💀
  @override
  Widget build(BuildContext context) {
    if (settings['playerTracker']) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: settings['primaryColor'],
          elevation: 0,
          title: Center(
            child: Tooltip(
              message: "Account Tracker",
              child: Text(
                "Account Tracker",
                style: TextStyle(
                    color: settings['secondaryColor'],
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 10),
              ),
            ),
          ),
          leading: Tooltip(
            message: "Return to the main menu",
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: settings['secondaryColor'],
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Tooltip(
                message: "Stop tracking this account.",
                child: Icon(
                  Icons.remove_circle_outline,
                  color: settings['secondaryColor'],
                ),
              ),
              onPressed: () async {
                setState(() {
                  settings['playerTracker'] = false;
                  settings['playerId'] = null;
                });
              },
            ),
          ],
        ),
        body: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          color: settings['primaryColor'],
          child: FutureBuilder(
              future: charsList(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Tooltip(
                            message:
                                "Information provided about this account on RealmEye.",
                            child: Text(
                              "Account Summary:",
                              style: TextStyle(
                                  color: settings['secondaryColor'],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "PS2P",
                                  fontSize: 10),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: settings['primaryColor'],
                              border: Border.all(
                                  width: 3, color: settings['secondaryColor']),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: settings['secondaryColor'],
                                    offset: Offset(2, 2),
                                    blurRadius: 3)
                              ]),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Account name:",
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (summaryData.containsKey("Characters"))
                                      Text(
                                        "Characters:",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Fame"))
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          "Pending Fame:",
                                          style: TextStyle(
                                              color: settings['secondaryColor'],
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "PS2P",
                                              fontSize: 10),
                                        ),
                                      ),
                                    if (summaryData.containsKey("Account fame"))
                                      Text(
                                        "Fame balance:",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Rank"))
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          "Stars:",
                                          style: TextStyle(
                                              color: settings['secondaryColor'],
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "PS2P",
                                              fontSize: 10),
                                        ),
                                      ),
                                    if (summaryData.containsKey("Guild"))
                                      Text(
                                        "Guild:",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Guild Rank"))
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Text(
                                          "Guild Rank:",
                                          style: TextStyle(
                                              color: settings['secondaryColor'],
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "PS2P",
                                              fontSize: 10),
                                        ),
                                      ),
                                    if (summaryData.containsKey("First seen"))
                                      Text(
                                        "First seen:",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Created"))
                                      Text(
                                        "Created:",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Last seen") &&
                                            summaryData
                                                .containsKey("First seen") ||
                                        summaryData.containsKey("Last seen") &&
                                            summaryData.containsKey("Created"))
                                      SizedBox(
                                        height: 10,
                                      ),
                                    if (summaryData.containsKey("Last seen"))
                                      Text(
                                        "Last seen:",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      settings['playerId'],
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (summaryData.containsKey("Characters"))
                                      Text(
                                        summaryData['Characters'],
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Fame"))
                                      SizedBox(
                                        height: 7,
                                      ),
                                    if (summaryData.containsKey("Fame"))
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "images/fame.png",
                                            height: 15,
                                            width: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            summaryData['Fame'].split(" ")[0],
                                            style: TextStyle(
                                                color:
                                                    settings['secondaryColor'],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PS2P",
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    if (summaryData.containsKey("Account fame"))
                                      SizedBox(
                                        height: 7,
                                      ),
                                    if (summaryData.containsKey("Account fame"))
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            "images/fame.png",
                                            height: 15,
                                            width: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            summaryData['Account fame']
                                                .split(" ")[0],
                                            style: TextStyle(
                                                color:
                                                    settings['secondaryColor'],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PS2P",
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    if (summaryData.containsKey("Rank"))
                                      SizedBox(
                                        height: 2,
                                      ),
                                    if (summaryData.containsKey("Rank"))
                                      Row(
                                        children: [
                                          accountStar(),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            summaryData['Rank'].split(" ")[0],
                                            style: TextStyle(
                                                color:
                                                    settings['secondaryColor'],
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "PS2P",
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    if (summaryData.containsKey("Rank"))
                                      SizedBox(
                                        height: 4,
                                      ),
                                    if (summaryData.containsKey("Guild"))
                                      Text(
                                        summaryData['Guild'],
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Guild"))
                                      SizedBox(
                                        height: 10,
                                      ),
                                    if (summaryData.containsKey("Guild Rank"))
                                      Text(
                                        summaryData['Guild Rank'].split(" ")[0],
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Guild Rank"))
                                      SizedBox(
                                        height: 10,
                                      ),
                                    if (summaryData.containsKey("First seen") &&
                                        summaryData["First seen"] != "hidden")
                                      Text(
                                        summaryData['First seen'],
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("First seen") &&
                                        summaryData["First seen"] == "hidden")
                                      Text(
                                        "hidden",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Created") &&
                                        summaryData["Created"] != "hidden")
                                      Text(
                                        summaryData['Created'],
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Created") &&
                                        summaryData["Created"] == "hidden")
                                      Text(
                                        "hidden",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData.containsKey("Created"))
                                      SizedBox(
                                        height: 10,
                                      ),
                                    if (summaryData.containsKey("Last seen") &&
                                        summaryData.containsKey("First seen"))
                                      SizedBox(
                                        height: 10,
                                      ),
                                    if (summaryData["Last seen"] != "hidden")
                                      Text(
                                        formatTime(DateTime.parse(
                                                summaryData['Last seen']
                                                    .split(" at ")[0])
                                            .millisecondsSinceEpoch),
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                    if (summaryData["Last seen"] == "hidden")
                                      Text(
                                        "hidden",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Tooltip(
                            message:
                                "Information about every character publicly tracked on this account.",
                            child: Text(
                              "Characters tracked:",
                              style: TextStyle(
                                  color: settings['secondaryColor'],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "PS2P",
                                  fontSize: 10),
                            ),
                          ),
                        ),
                        if (snapshot.data.length != 0)
                          Expanded(
                            child: SingleChildScrollView(
                              child: Center(
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runAlignment: WrapAlignment.center,
                                  children: snapshot.data,
                                ),
                              ),
                            ),
                          ),
                        if (snapshot.data.length == 0)
                          Center(
                            child: Container(
                              child: Tooltip(
                                  message:
                                      "This happens because this account has their RealmEye privacy settings to not display characters.",
                                  child: Text(
                                    "No characters to display!",
                                    style: TextStyle(
                                        color: settings['secondaryColor'],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "PS2P",
                                        fontSize: 10),
                                  )),
                            ),
                          ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Tooltip(
                            message:
                                "Information provided about this account on RealmEye.",
                            child: Text(
                              "Account Summary:",
                              style: TextStyle(
                                  color: settings['secondaryColor'],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "PS2P",
                                  fontSize: 10),
                            ),
                          ),
                        ),
                        Container(
                          child: Tooltip(
                            message:
                                "If this is taking too long, please press Refresh.",
                            child: CircularProgressIndicator(
                              backgroundColor: settings['secondaryColor'],
                              strokeWidth: 8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Tooltip(
                            message:
                                "Information about every character publicly tracked on this account.",
                            child: Text(
                              "Characters tracked:",
                              style: TextStyle(
                                  color: settings['secondaryColor'],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "PS2P",
                                  fontSize: 10),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Tooltip(
                              message:
                                  "If this is taking too long, please press Refresh.",
                              child: CircularProgressIndicator(
                                backgroundColor: settings['secondaryColor'],
                                strokeWidth: 8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: settings['secondaryColor'],
          onPressed: () {
            setState(() {
              settings['playerTracker'] = true;
            });
          },
          tooltip: 'Refresh',
          child: Icon(
            Icons.refresh,
            color: settings['primaryColor'],
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: settings['primaryColor'],
          elevation: 0,
          title: Tooltip(
            message: "Account Tracker",
            child: Text(
              "Account Tracker",
              style: TextStyle(
                  color: settings['secondaryColor'],
                  fontWeight: FontWeight.bold,
                  fontFamily: "PS2P",
                  fontSize: 10),
            ),
          ),
          leading: Tooltip(
            message: "Return to the main menu",
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: settings['secondaryColor'],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: settings['primaryColor'],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Tooltip(
                message:
                    "Input below the in-game name of a player to retrieve their stats.\nIf the provided player can't be found on RealmEye, you will be returned to this screen automatically to try again.",
                child: Text(
                  "Track an account:",
                  style: TextStyle(
                      fontFamily: "PS2P",
                      fontSize: 12,
                      color: settings['secondaryColor']),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              width: 300,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 5, color: settings['secondaryColor']),
                  color: settings['primaryColor'],
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  boxShadow: [
                    BoxShadow(
                        color: settings['secondaryColor'],
                        offset: Offset(2, 2),
                        blurRadius: 3)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                    style: TextStyle(
                        fontFamily: "PS2P",
                        fontSize: 12,
                        color: settings['secondaryColor']),
                    decoration: InputDecoration(
                      labelText: "In-Game Name?",
                      labelStyle: TextStyle(
                          color: settings['secondaryColor'],
                          fontFamily: "PS2P",
                          fontSize: 10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: settings['secondaryColor'],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                    strutStyle: StrutStyle(fontFamily: "PS2P", fontSize: 10),
                    controller: TextEditingController(),
                    onSubmitted: (String value) {
                      setState(() {
                        settings['playerId'] = value;
                        settings['playerTracker'] = true;
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
