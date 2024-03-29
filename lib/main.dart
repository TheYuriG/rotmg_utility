import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'account.dart';
import 'dailies.dart';
import 'trading.dart';
import 'package:web_scraper/web_scraper.dart';
import 'data.dart';
import 'package:path_provider_windows/path_provider_windows.dart' as windows;

// webScrapper define qual dominio será usado para puxar informação.
final webScraper = WebScraper('https://www.realmeye.com');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pathProvider;
  if (Platform.isAndroid) {
    pathProvider = (await getApplicationSupportDirectory()).path;
  } else if (Platform.isWindows) {
    pathProvider =
        (await windows.PathProviderWindows().getApplicationSupportPath());
  }
  Hive.init(pathProvider);
  await Hive.openBox("settings");
  try {
    settings.get('whiteTheme');
  } catch (e) {
    settings.put('whiteTheme', true);
    settings.put('primaryColor', 0xFFE3F2FD);
    settings.put('secondaryColor', 0xFF1976D2);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget themeSelector() {
    if (settings.get('whiteTheme') == false) {
      return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.blue[300]),
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Tooltip(
          message: "Switch to ice theme!",
          child: IconButton(
              icon: Icon(
                Icons.ac_unit,
                color: Colors.blue[700],
              ),
              onPressed: () {
                setState(() {
                  settings.put('whiteTheme', true);
                  settings.put('primaryColor', 0xFFBBDEFB);
                  settings.put('secondaryColor', 0xFF1976D2);
                });
              }),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.grey[700]),
          color: Colors.blue[100],
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Tooltip(
          message: "Switch to dark theme!",
          child: IconButton(
              icon: Image.asset(
                "assets/moon.ico",
                color: Colors.grey[700],
              ),
              onPressed: () {
                setState(() {
                  settings.put('whiteTheme', false);
                  settings.put('primaryColor', 0xFF000000);
                  settings.put('secondaryColor', 0xFF616161);
                });
              }),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: settings.get('whiteTheme') == true
              ? Colors.blue[200]
              : Colors.grey[900],
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "Welcome to\nRotMG Utility!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(settings.get('secondaryColor')),
                    fontFamily: "PS2P",
                    fontSize: 20),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey[700],
                  child: Tooltip(
                    message: "Oryx, the Mad God",
                    child: Image.asset(
                      "images/bigoryx.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              RawMaterialButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Color(settings.get('secondaryColor')),
                    ),
                    color: Color(settings.get('primaryColor')),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Tooltip(
                    message:
                        "Visit the trading center and view various items being traded by players!",
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.swap_horizontal_circle,
                          size: 25,
                          color: Color(settings.get('secondaryColor')),
                        ),
                        Text(
                          "Trading Center",
                          style: TextStyle(
                              color: Color(settings.get('secondaryColor')),
                              fontFamily: "PS2P",
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return Trading();
                    }),
                  );
                },
              ),
              SizedBox(height: 5),
              RawMaterialButton(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color(settings.get('secondaryColor'))),
                    color: Color(settings.get('primaryColor')),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Tooltip(
                    message:
                        "View many different informations about a certain account.\nYou can change the tracked user at any point, if so you desire.",
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person,
                          size: 25,
                          color: Color(settings.get('secondaryColor')),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Account Information",
                          style: TextStyle(
                              color: Color(settings.get('secondaryColor')),
                              fontFamily: "PS2P",
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return Account();
                    }),
                  );
                },
              ),
              SizedBox(height: 5),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return Dailies();
                    }),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color(settings.get('secondaryColor'))),
                    color: Color(settings.get('primaryColor')),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  child: Tooltip(
                    message:
                        "Track your daily missions so that you don't have to visit the Tinkerer before you collected everything you need to deliver!",
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 25,
                          color: Color(settings.get('secondaryColor')),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Dailies Tracker",
                          style: TextStyle(
                              color: Color(settings.get('secondaryColor')),
                              fontFamily: "PS2P",
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              themeSelector()
            ]),
          )),
    );
  }
}
