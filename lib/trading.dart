import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'trading_items.dart';
import 'data.dart';

class Trading extends StatefulWidget {
  Trading({Key key}) : super(key: key);

  @override
  _TradingState createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(25)),
                  color: settings.get('whiteTheme') == true
                      ? Colors.blue[200]
                      : Colors.grey[900],
                ),
                child: Builder(builder: (context) {
                  var trade = Hive.box('trade');
                  return Column(
                    children: [
                      Container(
                        height: 50,
                        child: DrawerHeader(
                          child: Text(
                            "Offer Filters",
                            style: TextStyle(
                                color: Color(settings.get('secondaryColor')),
                                fontFamily: "PS2P",
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Color(settings.get('secondaryColor'))),
                            color: Color(settings.get('primaryColor')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(settings.get('secondaryColor')),
                                  offset: Offset(2, 2),
                                  blurRadius: 3)
                            ]),
                        child: Tooltip(
                          message:
                              "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                          child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Enable/Disable potions/inc offers",
                                style: TextStyle(
                                    color:
                                        Color(settings.get('secondaryColor')),
                                    fontFamily: "PS2P",
                                    fontSize: 10),
                              ),
                              value: trade.get('pots') ?? true,
                              onChanged: (bool value) {
                                setState(() {
                                  trade.put('pots', value);
                                });
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Color(settings.get('secondaryColor'))),
                            color: Color(settings.get('primaryColor')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(settings.get('secondaryColor')),
                                  offset: Offset(2, 2),
                                  blurRadius: 3)
                            ]),
                        child: Tooltip(
                          message:
                              "Enable/disable offers for weapons, ranging from Tier 9 to Tier 12, excluding event/time limited weapons.",
                          child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Enable/Disable weapons offers",
                                style: TextStyle(
                                    color:
                                        Color(settings.get('secondaryColor')),
                                    fontFamily: "PS2P",
                                    fontSize: 10),
                              ),
                              value: trade.get('weapons') ?? true,
                              onChanged: (bool value) {
                                setState(() {
                                  trade.put('weapons', value);
                                });
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Color(settings.get('secondaryColor'))),
                            color: Color(settings.get('primaryColor')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(settings.get('secondaryColor')),
                                  offset: Offset(2, 2),
                                  blurRadius: 3)
                            ]),
                        child: Tooltip(
                          message:
                              "Enable/disable offers for class abilities, from Tiers 5 and 6, excluding event/time limited abilities.",
                          child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Enable/Disable class abilities offers",
                                style: TextStyle(
                                    color:
                                        Color(settings.get('secondaryColor')),
                                    fontFamily: "PS2P",
                                    fontSize: 10),
                              ),
                              value: trade.get('class') ?? true,
                              onChanged: (bool value) {
                                setState(() {
                                  trade.put('class', value);
                                });
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Color(settings.get('secondaryColor'))),
                            color: Color(settings.get('primaryColor')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(settings.get('secondaryColor')),
                                  offset: Offset(2, 2),
                                  blurRadius: 3)
                            ]),
                        child: Tooltip(
                          message:
                              "Enable/disable offers for armors, ranging from Tier 9 to Tier 13, excluding event/time limited armors",
                          child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Enable/Disable armor offers",
                                style: TextStyle(
                                    color:
                                        Color(settings.get('secondaryColor')),
                                    fontFamily: "PS2P",
                                    fontSize: 10),
                              ),
                              value: trade.get('armor') ?? true,
                              onChanged: (bool value) {
                                setState(() {
                                  trade.put('armor', value);
                                });
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Color(settings.get('secondaryColor'))),
                            color: Color(settings.get('primaryColor')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(settings.get('secondaryColor')),
                                  offset: Offset(2, 2),
                                  blurRadius: 3)
                            ]),
                        child: Tooltip(
                          message:
                              "Enable/disable offers for rings, ranging from Tier 4 to Tier 6, including Ring of Decades (Deca) and excluding event/time limited rings.",
                          child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Enable/Disable rings offers",
                                style: TextStyle(
                                    color:
                                        Color(settings.get('secondaryColor')),
                                    fontFamily: "PS2P",
                                    fontSize: 10),
                              ),
                              value: trade.get('rings') ?? true,
                              onChanged: (bool value) {
                                setState(() {
                                  trade.put('rings', value);
                                });
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 5,
                                color: Color(settings.get('secondaryColor'))),
                            color: Color(settings.get('primaryColor')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(settings.get('secondaryColor')),
                                  offset: Offset(2, 2),
                                  blurRadius: 3)
                            ]),
                        child: Tooltip(
                          message:
                              "Enable/disable offers for common and uncommon eggs.",
                          child: CheckboxListTile(
                              contentPadding: EdgeInsets.all(0),
                              title: Text(
                                "Enable/Disable egg offers",
                                style: TextStyle(
                                    color:
                                        Color(settings.get('secondaryColor')),
                                    fontFamily: "PS2P",
                                    fontSize: 10),
                              ),
                              value: trade.get('eggs') ?? true,
                              onChanged: (bool value) {
                                setState(() {
                                  trade.put('eggs', value);
                                });
                              }),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 5,
                                  color: Color(settings.get('secondaryColor'))),
                              color: Color(settings.get('primaryColor')),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Color(settings.get('secondaryColor')),
                                    offset: Offset(2, 2),
                                    blurRadius: 3)
                              ]),
                          child: Tooltip(
                            message:
                                "Enable/disable offers for the 2 (two) currently tradeable true ST sets (although the pieces are mislabeled as UTs at the time this was made). These are considered \"true\" sets for being the only sets that will grant a transformation and set piece bonuses for each equipped piece. If all Oryxmax gear was tradeable and avaiable, it would be considered to be included, despite lacking a transformation.",
                            child: CheckboxListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text(
                                  "Enable/Disable ST* offers",
                                  style: TextStyle(
                                      color:
                                          Color(settings.get('secondaryColor')),
                                      fontFamily: "PS2P",
                                      fontSize: 10),
                                ),
                                value: trade.get('st') ?? true,
                                onChanged: (bool value) {
                                  setState(() {
                                    trade.put('st', value);
                                  });
                                }),
                          )),
                    ],
                  );
                })),
          ),
        ),
      ),
      backgroundColor: settings.get('whiteTheme') == true
          ? Colors.blue[200]
          : Colors.grey[900],
      appBar: AppBar(
          backgroundColor: Color(settings.get('primaryColor')),
          // elevation: 0,
          centerTitle: true,
          title: Center(
            child: Tooltip(
              message: "Trading Center",
              child: Text(
                "Trading Center",
                style: TextStyle(
                    color: Color(settings.get('secondaryColor')),
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 10),
              ),
            ),
          ),
          leading: Tooltip(
            message: "Return to the main menu",
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Color(settings.get('secondaryColor')),
              ),
            ),
          ),
          actions: [
            Builder(builder: (BuildContext context) {
              return IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.settings,
                  color: Color(settings.get('secondaryColor')),
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            }),
          ]),
      body: TradingItems(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(settings.get('secondaryColor')),
        onPressed: () {
          setState(() {
            TradingItems();
          });
        },
        tooltip: 'Refresh',
        child: Icon(
          Icons.refresh,
          color: Color(settings.get('primaryColor')),
        ),
      ),
    );
  }
}
