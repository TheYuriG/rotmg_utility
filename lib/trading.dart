import 'package:flutter/material.dart';
import 'display_items.dart';
import 'data.dart';

class Trading extends StatefulWidget {
  Trading({Key key}) : super(key: key);

  @override
  _TradingState createState() => _TradingState();
}

class _TradingState extends State<Trading> {
  initState() {
    DisplayItems(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: settings['primaryColor'],
      appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
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
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.settings,
                color: settings['secondaryColor'],
                size: 30,
              ),
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: settings['primaryColor'],
                      title: Center(
                        child: Text(
                          'Change offer filters!',
                          style: TextStyle(
                              color: settings['secondaryColor'],
                              fontFamily: "PS2P",
                              fontSize: 12),
                        ),
                      ),
                      content: Container(
                        width: 420,
                        child: Wrap(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 190,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: settings['secondaryColor']),
                                  color: settings['primaryColor'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: settings['secondaryColor'],
                                        offset: Offset(2, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Tooltip(
                                message:
                                    "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                                child: RawMaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: Text(
                                      "Potions",
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    onPressed: () {
                                      if (settings['pots']) {
                                        setState(() {
                                          settings['pots'] = false;
                                        });
                                      } else {
                                        setState(() {
                                          settings['pots'] = true;
                                        });
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: settings['secondaryColor']),
                                  color: settings['primaryColor'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: settings['secondaryColor'],
                                        offset: Offset(2, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Tooltip(
                                message:
                                    "Enable/disable offers for weapons, ranging from Tier 9 to Tier 12, excluding event/time limited weapons.",
                                child: RawMaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: Text(
                                      "Weapons",
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    onPressed: () {
                                      if (settings['weapons']) {
                                        setState(() {
                                          settings['weapons'] = false;
                                        });
                                      } else {
                                        setState(() {
                                          settings['weapons'] = true;
                                        });
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: settings['secondaryColor']),
                                  color: settings['primaryColor'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: settings['secondaryColor'],
                                        offset: Offset(2, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Tooltip(
                                message:
                                    "Enable/disable offers for normal abilities, from Tiers 5 and 6, excluding event/time limited abilities.",
                                child: RawMaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: Text(
                                      "Abilities",
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    onPressed: () {
                                      if (settings['class']) {
                                        setState(() {
                                          settings['class'] = false;
                                        });
                                      } else {
                                        setState(() {
                                          settings['class'] = true;
                                        });
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: settings['secondaryColor']),
                                  color: settings['primaryColor'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: settings['secondaryColor'],
                                        offset: Offset(2, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Tooltip(
                                message:
                                    "Enable/disable offers for armors, ranging from Tier 9 to Tier 13, excluding event/time limited armors",
                                child: RawMaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: Text(
                                      "Armor",
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    onPressed: () {
                                      if (settings['armor']) {
                                        setState(() {
                                          settings['armor'] = false;
                                        });
                                      } else {
                                        setState(() {
                                          settings['armor'] = true;
                                        });
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: settings['secondaryColor']),
                                  color: settings['primaryColor'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: settings['secondaryColor'],
                                        offset: Offset(2, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Tooltip(
                                message:
                                    "Enable/disable offers for rings, ranging from Tier 4 to Tier 6, including Ring of Decades (Deca) and excluding event/time limited rings.",
                                child: RawMaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: Text(
                                      "Rings",
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    onPressed: () {
                                      if (settings['rings']) {
                                        setState(() {
                                          settings['rings'] = false;
                                        });
                                      } else {
                                        setState(() {
                                          settings['rings'] = true;
                                        });
                                      }
                                    }),
                              ),
                            ),
                            Container(
                              width: 190,
                              height: 50,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 5,
                                      color: settings['secondaryColor']),
                                  color: settings['primaryColor'],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: settings['secondaryColor'],
                                        offset: Offset(2, 2),
                                        blurRadius: 3)
                                  ]),
                              child: Tooltip(
                                message:
                                    "Enable/disable offers for common and uncommon eggs.",
                                child: RawMaterialButton(
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    child: Text(
                                      "Eggs",
                                      style: TextStyle(
                                          color: settings['secondaryColor'],
                                          fontFamily: "PS2P",
                                          fontSize: 10),
                                    ),
                                    onPressed: () {
                                      if (settings['eggs']) {
                                        setState(() {
                                          settings['eggs'] = false;
                                        });
                                      } else {
                                        setState(() {
                                          settings['eggs'] = true;
                                        });
                                      }
                                    }),
                              ),
                            ),
                            Container(
                                width: 190,
                                height: 50,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 5,
                                        color: settings['secondaryColor']),
                                    color: settings['primaryColor'],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: settings['secondaryColor'],
                                          offset: Offset(2, 2),
                                          blurRadius: 3)
                                    ]),
                                child: Tooltip(
                                  message:
                                      "Enable/disable offers for the 2 (two) currently tradeable true ST sets (although the pieces are mislabeled as UTs at the time this was made). These are considered \"true\" sets for being the only sets that will grant a transformation and set piece bonuses for each equipped piece. If all Oryxmax gear was tradeable and avaiable, it would be considered to be included, despite lacking a transformation.",
                                  child: RawMaterialButton(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      child: Text(
                                        "True* STs",
                                        style: TextStyle(
                                            color: settings['secondaryColor'],
                                            fontFamily: "PS2P",
                                            fontSize: 10),
                                      ),
                                      onPressed: () {
                                        if (settings['st']) {
                                          setState(() {
                                            settings['st'] = false;
                                          });
                                        } else {
                                          setState(() {
                                            settings['st'] = true;
                                          });
                                        }
                                      }),
                                )),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 5,
                                    color: settings['secondaryColor']),
                                color: settings['primaryColor'],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: settings['secondaryColor'],
                                      offset: Offset(2, 2),
                                      blurRadius: 3)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Save settings',
                                style: TextStyle(
                                    color: settings['secondaryColor'],
                                    fontFamily: "PS2P",
                                    fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ]),
      body: DisplayItems(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: settings['secondaryColor'],
        onPressed: () {
          setState(() {
            DisplayItems(context);
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
