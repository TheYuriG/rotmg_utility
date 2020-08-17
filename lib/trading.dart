import 'package:flutter/material.dart';
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
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            color: settings['primaryColor'],
            child: Column(
              children: [
                DrawerHeader(
                  child: Text(
                    "Filter menu",
                    style: TextStyle(
                        color: settings['secondaryColor'],
                        fontFamily: "PS2P",
                        fontSize: 10),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: settings['secondaryColor']),
                      color: settings['primaryColor'],
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                            color: settings['secondaryColor'],
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Tooltip(
                    message:
                        "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                    child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Offers for potions and inc?",
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 10),
                        ),
                        value: settings['pots'],
                        onChanged: (bool value) {
                          setState(() {
                            settings['pots'] = value;
                          });
                        }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: settings['secondaryColor']),
                      color: settings['primaryColor'],
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                            color: settings['secondaryColor'],
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Tooltip(
                    message:
                        "Enable/disable offers for weapons, ranging from Tier 9 to Tier 12, excluding event/time limited weapons.",
                    child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Offers for weapons?",
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 10),
                        ),
                        value: settings['weapons'],
                        onChanged: (bool value) {
                          setState(() {
                            settings['weapons'] = value;
                          });
                        }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: settings['secondaryColor']),
                      color: settings['primaryColor'],
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                            color: settings['secondaryColor'],
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Tooltip(
                    message:
                        "Enable/disable offers for normal abilities, from Tiers 5 and 6, excluding event/time limited abilities.",
                    child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Offers for class abilities?",
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 10),
                        ),
                        value: settings['class'],
                        onChanged: (bool value) {
                          setState(() {
                            settings['class'] = value;
                          });
                        }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: settings['secondaryColor']),
                      color: settings['primaryColor'],
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                            color: settings['secondaryColor'],
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Tooltip(
                    message:
                        "Enable/disable offers for armors, ranging from Tier 9 to Tier 13, excluding event/time limited armors",
                    child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Offers for armor?",
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 10),
                        ),
                        value: settings['armor'],
                        onChanged: (bool value) {
                          setState(() {
                            settings['armor'] = value;
                          });
                        }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: settings['secondaryColor']),
                      color: settings['primaryColor'],
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                            color: settings['secondaryColor'],
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Tooltip(
                    message:
                        "Enable/disable offers for rings, ranging from Tier 4 to Tier 6, including Ring of Decades (Deca) and excluding event/time limited rings.",
                    child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Offers for rings?",
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 10),
                        ),
                        value: settings['rings'],
                        onChanged: (bool value) {
                          setState(() {
                            settings['rings'] = value;
                          });
                        }),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 5, color: settings['secondaryColor']),
                      color: settings['primaryColor'],
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                            color: settings['secondaryColor'],
                            offset: Offset(2, 2),
                            blurRadius: 3)
                      ]),
                  child: Tooltip(
                    message:
                        "Enable/disable offers for common and uncommon eggs.",
                    child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text(
                          "Offers for eggs?",
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 10),
                        ),
                        value: settings['eggs'],
                        onChanged: (bool value) {
                          setState(() {
                            settings['eggs'] = value;
                          });
                        }),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 5, color: settings['secondaryColor']),
                        color: settings['primaryColor'],
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                              color: settings['secondaryColor'],
                              offset: Offset(2, 2),
                              blurRadius: 3)
                        ]),
                    child: Tooltip(
                      message:
                          "Enable/disable offers for the 2 (two) currently tradeable true ST sets (although the pieces are mislabeled as UTs at the time this was made). These are considered \"true\" sets for being the only sets that will grant a transformation and set piece bonuses for each equipped piece. If all Oryxmax gear was tradeable and avaiable, it would be considered to be included, despite lacking a transformation.",
                      child: CheckboxListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            "Offers for True* STs?",
                            style: TextStyle(
                                color: settings['secondaryColor'],
                                fontFamily: "PS2P",
                                fontSize: 10),
                          ),
                          value: settings['st'],
                          onChanged: (bool value) {
                            setState(() {
                              settings['st'] = value;
                            });
                          }),
                    )),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: settings['primaryColor'],
      appBar: AppBar(
          backgroundColor: settings['primaryColor'],
          elevation: 0,
          centerTitle: true,
          title: Center(
            child: Tooltip(
              message: "Trading Center",
              child: Text(
                "Trading Center",
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
          actions: [
            Builder(builder: (BuildContext context) {
              return IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.settings,
                  color: settings['secondaryColor'],
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
        backgroundColor: settings['secondaryColor'],
        onPressed: () {
          setState(() {
            TradingItems();
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
}
