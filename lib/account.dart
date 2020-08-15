// bottomNavigationBar: FutureBuilder(
//         future: playerData(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (!settings['playerTracker']) {
//             return SizedBox();
//           } else if (snapshot.hasData &&
//               snapshot.connectionState == ConnectionState.done) {
//             return Container(
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: settings['primaryColor'],
//                   border:
//                       Border.all(width: 3, color: settings['secondaryColor']),
//                   borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                   boxShadow: [
//                     BoxShadow(
//                         color: settings['secondaryColor'],
//                         offset: Offset(5, 5),
//                         blurRadius: 5)
//                   ]),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Image.asset(
//                           'images/chars/${charData[0]['class'].toLowerCase()}.png',
//                           height: 50,
//                           width: 50,
//                         ),
//                         Text(
//                           charData[0]['class'],
//                           style: TextStyle(
//                               color: settings['secondaryColor'],
//                               fontFamily: "PS2P",
//                               fontSize: 12),
//                           textAlign: TextAlign.center,
//                         ),
//                         Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: retrieveStars(charData[0]['stars'])),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     "Fame:\n${charData[0]['fame']}",
//                     style: TextStyle(
//                         color: settings['secondaryColor'],
//                         fontFamily: "PS2P",
//                         fontSize: 12),
//                     textAlign: TextAlign.center,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Text(
//                       "Stats:\n${charData[0]['stats']['maxed']}",
//                       style: TextStyle(
//                           color: settings['secondaryColor'],
//                           fontFamily: "PS2P",
//                           fontSize: 12),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   lastServer(0),
//                 ],
//               ),
//             );
//           } else {
//             return Container(
//               height: 100,
//               margin: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: settings['primaryColor'],
//                   border:
//                       Border.all(width: 3, color: settings['secondaryColor']),
//                   borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                   boxShadow: [
//                     BoxShadow(
//                         color: settings['secondaryColor'],
//                         offset: Offset(5, 5),
//                         blurRadius: 5)
//                   ]),
//               child: Center(
//                 child: Tooltip(
//                   message: "If this is taking too long, please press Refresh.",
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircularProgressIndicator(
//                         backgroundColor: settings['secondaryColor'],
//                         strokeWidth: 8,
//                       ),
//                       SizedBox(height: 10),
//                       Text("Now fetching your character data...",
//                           style: TextStyle(
//                               color: Colors.grey, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//         },
//       ),

//     List<Widget> charsList() {
//   List<Widget> chars = [];
//   for (var k = 0; k < charData.length; k++) {
//     chars.add(
//       Container(
//         margin: EdgeInsets.all(5),
//         decoration: BoxDecoration(
//             color: settings['primaryColor'],
//             border: Border.all(width: 3, color: settings['secondaryColor']),
//             borderRadius: BorderRadius.all(Radius.circular(15.0)),
//             boxShadow: [
//               BoxShadow(
//                   color: settings['secondaryColor'],
//                   offset: Offset(2, 2),
//                   blurRadius: 3)
//             ]),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset(
//                     'images/chars/${charData[k]['class'].toLowerCase()}.png',
//                     height: 40,
//                     width: 40,
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         charData[k]['stats']['maxed'],
//                         style: TextStyle(
//                             color: settings['secondaryColor'],
//                             fontFamily: "PS2P",
//                             fontSize: 12),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         charData[k]['class'],
//                         style: TextStyle(
//                             color: settings['secondaryColor'],
//                             fontFamily: "PS2P",
//                             fontSize: 12),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                   lastServer(k),
//                   Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: retrieveStars(charData[k]['stars'])),
//                   Row(
//                     children: [
//                       Image.asset(
//                         'images/fame.png',
//                         height: 20,
//                         width: 20,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "${charData[k]['fame']}",
//                         style: TextStyle(
//                             color: settings['secondaryColor'],
//                             fontFamily: "PS2P",
//                             fontSize: 12),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   return chars;
// }

// IconButton(
//               icon: charButton(),
//               onPressed: () async {
//                 if (settings['playerTracker']) {
//                   await showDialog<void>(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         backgroundColor: settings['primaryColor'],
//                         title: Center(
//                           child: Text(
//                             'All chars tracked on this account:',
//                             style: TextStyle(
//                                 color: settings['secondaryColor'],
//                                 fontFamily: "PS2P",
//                                 fontSize: 12),
//                           ),
//                         ),
//                         content: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height,
//                           child: ListView(
//                             children: [
//                               Wrap(
//                                 children: charsList(),
//                               )
//                             ],
//                           ),
//                         ),
//                         actions: <Widget>[
//                           FlatButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: Container(
//                               margin: EdgeInsets.all(10),
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       width: 5,
//                                       color: settings['secondaryColor']),
//                                   color: settings['primaryColor'],
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(15.0)),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: settings['secondaryColor'],
//                                         offset: Offset(2, 2),
//                                         blurRadius: 3)
//                                   ]),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10),
//                                 child: Text(
//                                   'Close',
//                                   style: TextStyle(
//                                       color: settings['secondaryColor'],
//                                       fontFamily: "PS2P",
//                                       fontSize: 10),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 } else {
//                   return null;
//                 }
//               },
//             ),

// charButton() {
//     if (settings['playerTracker']) {
//       return FutureBuilder(
//           future: playerData(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasData &&
//                 snapshot.connectionState == ConnectionState.done) {
//               return Tooltip(
//                 message:
//                     "Click here to view all tracked characters for the current user!",
//                 child: Image.asset(
//                   "images/chars/${charData[0]['class'].toLowerCase()}.png",
//                   height: 30,
//                   width: 30,
//                 ),
//               );
//             } else {
//               return CircularProgressIndicator(
//                 backgroundColor: settings['primaryColor'],
//                 strokeWidth: 4,
//               );
//             }
//           });
//     } else {
//       return Builder(builder: (context) {
//         return Tooltip(
//           message:
//               "Track an user to be able to see all their tracked characters with this button!",
//           child: RawMaterialButton(
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//             child: Icon(
//               Icons.sms_failed,
//               size: 40,
//               color: settings['primaryColor'],
//             ),
//           ),
//         );
//       });
//     }
// }

// drawer: Container(
//         padding: EdgeInsets.all(20),
//         width: 300,
//         color: settings['primaryColor'],
//         child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                 child: Text(
//                   "Change different options",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       color: settings['secondaryColor'],
//                       fontFamily: "PS2P",
//                       fontSize: 11),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           width: 5, color: settings['secondaryColor']),
//                       color: settings['primaryColor'],
//                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: settings['secondaryColor'],
//                             offset: Offset(2, 2),
//                             blurRadius: 3)
//                       ]),
//                   child: CheckboxListTile(
//                       title: Text(
//                         "Use White Theme?",
//                         style: TextStyle(
//                             color: settings['secondaryColor'],
//                             fontFamily: "PS2P",
//                             fontSize: 10),
//                       ),
//                       controlAffinity: ListTileControlAffinity.trailing,
//                       activeColor: settings['primaryColor'],
//                       checkColor: settings['secondaryColor'],
//                       value: settings['whiteTheme'],
//                       onChanged: (bool state) {
//                         if (state == true) {
//                           setState(() {
//                             settings['whiteTheme'] = state;
//                             settings['primaryColor'] = Colors.white;
//                             settings['secondaryColor'] = Colors.black;
//                           });
//                         } else {
//                           setState(() {
//                             settings['whiteTheme'] = state;
//                             settings['primaryColor'] = Colors.black;
//                             settings['secondaryColor'] = Colors.white;
//                           });
//                         }
//                       }),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           width: 5, color: settings['secondaryColor']),
//                       color: settings['primaryColor'],
//                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: settings['secondaryColor'],
//                             offset: Offset(2, 2),
//                             blurRadius: 3)
//                       ]),
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                     child: TextField(
//                         style: TextStyle(
//                             fontFamily: "PS2P",
//                             fontSize: 12,
//                             color: settings['secondaryColor']),
//                         decoration: InputDecoration(
//                           labelText: "In-Game Name?",
//                           labelStyle: TextStyle(
//                               color: settings['secondaryColor'],
//                               fontFamily: "PS2P",
//                               fontSize: 10),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               width: 3,
//                               color: settings['secondaryColor'],
//                             ),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(15.0)),
//                           ),
//                         ),
//                         strutStyle:
//                             StrutStyle(fontFamily: "PS2P", fontSize: 10),
//                         controller: TextEditingController(),
//                         onSubmitted: (String value) async {
//                           settings['playerId'] = value;
//                           settings['playerTracker'] = true;
// setState(() {
//   charButton();
// });
//                         }),
//                   ),
//                 ),
//               ),
//             ]),
//       ),

// if (settings['playerTracker']) {
//   playerData();
// }

// Future<Map<int, Map<String, dynamic>>> playerData() async {
//   // Essa variável puxa as informações de perfil e depois salva elas em "summaryData"
//   List<Map<String, dynamic>> summaryObject;
//   // Essa variável puxa as informações de personagens e depois salva elas em "charData"
//   List<Map<String, dynamic>> charObject;
//   // Essa variável puxa as informações de estatísticas e depois salva elas em "charData"
//   List<Map<String, dynamic>> statsObject;

//   // todas as informações são limpas antes de iniciar a função para evitar erros
//   // caso o usuário escolha trocar de usuário pra seguir.
//   summaryData = {};
//   charData = {};

//   if (await webScraper.loadWebPage('/player/${settings['playerId']}')) {
//     try {
//       // Isso puxa informação da conta do usuário acessado.
//       summaryObject =
//           webScraper.getElement('table.summary > tbody > tr > td', []);
//       // Isso puxa a listagem de personagens do jogador escolhido.
//       // Ainda é necessário checar caso isso seja invalido (ex: jogador escondeu todos os jogadores).
//       charObject = webScraper.getElement(
//           'table#e.table.table-striped.tablesorter > tbody > tr > td', []);
//       // Isso puxa as informações de estatisticas de todos os personagens.
//       // Essa informação é depois agregada no charData.
//       statsObject = webScraper.getElement(
//           'table#e.table.table-striped.tablesorter > tbody > tr > td > span.player-stats',
//           ['data-stats', 'data-bonuses']);

//       for (var i = 0; i < summaryObject.length; i++) {
//         if (i % 2 == 1) {
//           continue;
//         } else {
//           summaryData.addAll(
//               {summaryObject[i]['title']: summaryObject[i + 1]['title']});
//         }
//       }
//       starColor = accountStar();
//       if (summaryData['Last seen'] == "hidden") {
//         // Essa função puxa informação de personagens de uma conta que tem privacidade ativa.
//         // Para esses tipos de conta, não é possível puxar qual o último servidor e hora de login de cada personagem.
//         int i = 0;
//         for (var j = 0; j < charObject.length / 10; j++) {
//           charData.addAll({
//             j: {
//               'class': charObject[i + 2]['title'],
//               'level': charObject[i + 3]['title'],
//               'stars': charObject[i + 4]['title'],
//               'fame': charObject[i + 5]['title'],
//               'stats': {
//                 'maxed': charObject[i + 9]['title'],
//                 'current': null,
//                 'bonuses': null
//               },
//               'lastSeen': null,
//               'server': null
//             }
//           });
//           i += 10;
//         }
//       } else {
//         int i = 0;
//         for (var j = 0; j < charObject.length / 12; j++) {
//           charData.addAll({
//             j: {
//               'class': charObject[i + 2]['title'],
//               'level': charObject[i + 3]['title'],
//               'stars': charObject[i + 4]['title'],
//               'fame': charObject[i + 5]['title'],
//               'stats': {
//                 'maxed': charObject[i + 9]['title'],
//                 'current': null,
//                 'bonuses': null
//               },
//               'lastSeen': charObject[i + 10]['title'],
//               'server': charObject[i + 11]['title']
//             }
//           });
//           i += 12;
//         }
//       }
//       for (var m = 0; m < statsObject.length; m++) {
//         charData[m]['stats']['current'] =
//             statsObject[m]['attributes']['data-stats'];
//         charData[m]['stats']['bonuses'] =
//             statsObject[m]['attributes']['data-bonuses'];
//       }
//     } catch (e) {
//       settings['playerTracker'] = false;
//       settings['playerId'] = null;
//     }
//   }
//   return charData;
// }

// initState() {
//   playerData();
//   super.initState();
//   }

// // Essa variável limpa as estatisticas de charObject e organiza elas
// Map<int, Map<String, dynamic>> charData = {};

// Padding lastServer(int char) {
//   if (charData[char]['server'] != null) {
//     return Padding(
//       padding: EdgeInsets.all(0),
//       child: Text(
//         "Server: ${charData[char]['server']}",
//         style: TextStyle(
//             color: settings['secondaryColor'],
//             fontFamily: "PS2P",
//             fontSize: 12),
//         textAlign: TextAlign.center,
//       ),
//     );
//   } else {
//     return Padding(padding: EdgeInsets.all(0));
//   }
// }

// // Essa função vai calcular as estrelas da sua conta baseada na formula atual que usa 16 personagens, 5 estrelas cada.
// // Referência: https://www.realmeye.com/wiki/game-objectives
// Image accountStar() {
//   int accountStar = int.parse(summaryData['Rank']);
//   String starColor;
//   if (accountStar < 16) {
//     starColor = 'light_blue.png';
//   } else if (accountStar >= 16 && accountStar < 32) {
//     starColor = 'dark_blue';
//   } else if (accountStar >= 32 && accountStar < 48) {
//     starColor = 'red';
//   } else if (accountStar >= 48 && accountStar < 64) {
//     starColor = 'orange';
//   } else if (accountStar >= 64 && accountStar < 80) {
//     starColor = 'yellow';
//   } else if (accountStar == 80) {
//     starColor = "white";
//   }
//   return Image.asset(
//     'images/stars/$starColor.png',
//     width: 20,
//     height: 20,
//   );
// }

// // Essa função popula a coluna de CQC (Class Quests Completed) do menu de personagem.
// List<Image> retrieveStars(String char) {
//   List<Image> classStars = [];
//   int stars = int.parse(char[0]);
//   for (var i = 0; i < stars; i++) {
//     classStars.add(starColor);
//   }
//   return classStars;
// }

// // Essa variável limpa as estatisticas de summaryObject e organiza elas
// Map<String, String> summaryData = {};
// // Essa variavel guarda a cor da estrela da conta, para fácil acesso em outros locais.
// Image starColor;
