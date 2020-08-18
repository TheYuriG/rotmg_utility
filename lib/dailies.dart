import 'package:flutter/material.dart';
import 'data.dart';

class Dailies extends StatefulWidget {
  Dailies({Key key}) : super(key: key);

  @override
  _DailiesState createState() => _DailiesState();
}

Map<String, bool> dailiesSettings = {
  "craft": true,
  "beginner": true,
  "scout": true,
  "standart": true,
  "mighty": true,
  "epic": true,
};

class _DailiesState extends State<Dailies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.4,
        color: settings['primaryColor'],
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 50,
                child: DrawerHeader(
                  child: Text(
                    "Quest Filters",
                    style: TextStyle(
                        color: settings['secondaryColor'],
                        fontWeight: FontWeight.bold,
                        fontFamily: "PS2P",
                        fontSize: 15),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                child: Tooltip(
                  message:
                      "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                  child: CheckboxListTile(
                    secondary: Image.asset('images/pots/glifepot.png'),
                    title: Text(
                      "Enable/Disable Crafting Quests",
                      style: TextStyle(
                          color: settings['secondaryColor'],
                          fontWeight: FontWeight.bold,
                          fontFamily: "PS2P",
                          fontSize: 10),
                    ),
                    value: dailiesSettings['craft'],
                    onChanged: (bool value) {
                      setState(() {
                        dailiesSettings['craft'] = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                child: Tooltip(
                  message:
                      "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                  child: CheckboxListTile(
                    secondary:
                        Image.asset('images/quests/rewards/beginnerchest.png'),
                    title: Text(
                      "Enable/Disable Beginner Quests",
                      style: TextStyle(
                          color: settings['secondaryColor'],
                          fontWeight: FontWeight.bold,
                          fontFamily: "PS2P",
                          fontSize: 10),
                    ),
                    value: dailiesSettings['beginner'],
                    onChanged: (bool value) {
                      setState(() {
                        dailiesSettings['beginner'] = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                child: Tooltip(
                  message:
                      "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                  child: CheckboxListTile(
                    secondary: Image.asset('images/pots/mysterypot.png'),
                    title: Text(
                      "Enable/Disable Scout Quests",
                      style: TextStyle(
                          color: settings['secondaryColor'],
                          fontWeight: FontWeight.bold,
                          fontFamily: "PS2P",
                          fontSize: 10),
                    ),
                    value: dailiesSettings['scout'],
                    onChanged: (bool value) {
                      setState(() {
                        dailiesSettings['scout'] = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                child: Tooltip(
                  message:
                      "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                  child: CheckboxListTile(
                    secondary:
                        Image.asset('images/quests/rewards/standartchest.png'),
                    title: Text(
                      "Enable/Disable Standart Quests",
                      style: TextStyle(
                          color: settings['secondaryColor'],
                          fontWeight: FontWeight.bold,
                          fontFamily: "PS2P",
                          fontSize: 10),
                    ),
                    value: dailiesSettings['standart'],
                    onChanged: (bool value) {
                      setState(() {
                        dailiesSettings['standart'] = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                child: Tooltip(
                  message:
                      "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                  child: CheckboxListTile(
                    secondary:
                        Image.asset('images/quests/rewards/mightychest.png'),
                    title: Text(
                      "Enable/Disable Mighty Quests",
                      style: TextStyle(
                          color: settings['secondaryColor'],
                          fontWeight: FontWeight.bold,
                          fontFamily: "PS2P",
                          fontSize: 10),
                    ),
                    value: dailiesSettings['mighty'],
                    onChanged: (bool value) {
                      setState(() {
                        dailiesSettings['mighty'] = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                child: Tooltip(
                  message:
                      "Enable/disable offers for normal and greater potions, plus Wine Cellar Incantations.",
                  child: CheckboxListTile(
                    secondary:
                        Image.asset('images/quests/rewards/voidepicchest.png'),
                    title: Text(
                      "Enable/Disable Epic Quests",
                      style: TextStyle(
                          color: settings['secondaryColor'],
                          fontWeight: FontWeight.bold,
                          fontFamily: "PS2P",
                          fontSize: 10),
                    ),
                    value: dailiesSettings['epic'],
                    onChanged: (bool value) {
                      setState(() {
                        dailiesSettings['epic'] = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: settings['primaryColor'],
        elevation: 0,
        title: Tooltip(
          message: "Dailies Tracker",
          child: Text(
            "Dailies Tracker",
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
        actions: [
          Builder(builder: (context) {
            return IconButton(
                icon: Icon(
                  Icons.settings,
                  color: settings['secondaryColor'],
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer());
          })
        ],
      ),
      backgroundColor: settings['primaryColor'],
      body: DailyBody(context),
    );
  }
}

class DailyBody extends StatefulWidget {
  DailyBody(BuildContext context, {Key key}) : super(key: key);

  @override
  _DailyBodyState createState() => _DailyBodyState();
}

class _DailyBodyState extends State<DailyBody> {
  Map<String, Map<int, List>> dailiesMap = {
    "Beginner Quests": {
      1: [
        "The Pirate King",
        "Defeat Dreadstump the Pirate King in the Pirate Cave.",
        [
          "images/quests/beginner/piratecave.png",
          "images/quests/beginner/piratecave.png",
          "images/quests/beginner/piratecave.png",
          "images/quests/beginner/piratecave.png"
        ],
        ["images/quests/rewards/beginnerchest.png"]
      ],
      2: [
        "The Mama",
        "Defeat Mama Megamoth in the Forest Maze.",
        [
          "images/quests/beginner/forestmaze.png",
          "images/quests/beginner/forestmaze.png",
          "images/quests/beginner/forestmaze.png",
          "images/quests/beginner/forestmaze.png"
        ],
        [
          "images/quests/rewards/beginnerchest.png",
          "images/quests/rewards/treasuremap.png"
        ]
      ],
      3: [
        "The Spider Queen",
        "Defeat Arachna the Spider Queen in the Spider Den.",
        [
          "images/quests/beginner/spiderden.png",
          "images/quests/beginner/spiderden.png",
          "images/quests/beginner/spiderden.png",
          "images/quests/beginner/spiderden.png"
        ],
        ["images/quests/rewards/beginnerchest.png"]
      ],
      4: [
        "The Masked God",
        "Defeat Mixcoatl the Masked God in the Forbidden Jungle.",
        [
          "images/quests/beginner/forbiddenjungle.png",
          "images/quests/beginner/forbiddenjungle.png",
          "images/quests/beginner/forbiddenjungle.png",
          "images/quests/beginner/forbiddenjungle.png"
        ],
        ["images/quests/rewards/beginnerchest.png"]
      ],
      5: [
        "The Queen Bee",
        "Defeat the Queen Bee in the Hive.",
        [
          "images/quests/beginner/hive.png",
          "images/quests/beginner/hive.png",
          "images/quests/beginner/hive.png",
          "images/quests/beginner/hive.png"
        ],
        ["images/quests/rewards/beginnerchest.png"]
      ],
      6: [
        "Run the Table",
        "Get rid of all these lowly monsters and I’ll get some good gear for you.",
        [
          "images/quests/beginner/piratecave.png",
          "images/quests/beginner/forestmaze.png",
          "images/quests/beginner/spiderden.png",
          "images/quests/beginner/forbiddenjungle.png,",
          "images/quests/beginner/hive.png"
        ],
        [
          "images/quests/rewards/beginnerchest.png",
          "images/quests/rewards/treasuremap.png"
        ]
      ]
    },
    "Scout Quests": {
      1: [
        "Scout the Pit",
        "Scout the Snake pit and report back here!",
        ["images/quests/standart/snakepit.png"],
        ["images/pots/spdpot.png", "images/pots/spdpot.png"]
      ],
      2: [
        "Scout the Sprites",
        "Scout the Sprite World and report back here!",
        ["images/quests/standart/spriteworld.png"],
        ["images/pots/dexpot.png", "images/pots/dexpot.png"]
      ],
      3: [
        "Scout the Lair",
        "Scout the Undead Lair and report back here!",
        ["images/quests/standart/undeadlair.png"],
        ["images/pots/wispot.png", "images/pots/wispot.png"]
      ],
      4: [
        "Scout the Abyss",
        "Scout the Abyss of Demons and report back here!",
        ["images/quests/standart/abyss.png"],
        ["images/pots/vitpot.png", "images/pots/vitpot.png"]
      ],
      5: [
        "Scout the Sewers",
        "Scout the Toxic Sewers and report back here!",
        ["images/quests/standart/toxicsewers.png"],
        ["images/pots/defpot.png", "images/pots/defpot.png"]
      ],
      6: [
        "Scout the Theatre",
        "Scout the Puppet Master’s Theatre and report back here!",
        ["images/quests/standart/puppettheater.png"],
        ["images/pots/atkpot.png", "images/pots/atkpot.png"]
      ],
      7: [
        "Scout the Woods",
        "Scout the Magic Woods and report back here!",
        ["images/quests/standart/magicwoods.png"],
        ["images/pots/spdpot.png", "images/pots/dexpot.png"]
      ],
      8: [
        "Scout the Library",
        "Scout the Cursed Library and report back here!",
        ["images/quests/standart/cursedlibrary.png"],
        ["images/pots/wispot.png", "images/pots/vitpot.png"]
      ]
    },
    "Standart Quests": {
      1: [
        "The Snake Queen",
        "Defeat Stheno in the Snake Pit.",
        [
          "images/quests/standart/snakepit.png",
          "images/quests/standart/snakepit.png",
          "images/quests/standart/snakepit.png",
          "images/quests/standart/snakepit.png",
          "images/quests/standart/snakepit.png",
          "images/quests/standart/snakepit.png",
          "images/quests/standart/snakepit.png",
          "images/quests/standart/snakepit.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      2: [
        "The Sprite Goddess",
        "Defeat Limon in the Sprite World.",
        [
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      3: [
        "The Ghost God",
        "Defeat Septavius in the Undead Lair.",
        [
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      4: [
        "The Archdemon",
        "Defeat Malphas in the Abyss of Demons.",
        [
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      5: [
        "The Slime God",
        "Defeat Gulpord in the Toxic Sewers.",
        [
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/toxicsewers.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      6: [
        "The Puppet Master",
        "The Puppet Master",
        [
          "images/quests/standart/puppettheater.png",
          "images/quests/standart/puppettheater.png",
          "images/quests/standart/puppettheater.png",
          "images/quests/standart/puppettheater.png",
          "images/quests/standart/puppettheater.png",
          "images/quests/standart/puppettheater.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      7: [
        "The Fountain Spirit",
        "Defeat the Fountain Spirit in the Magic Woods.",
        [
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/magicwoods.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      8: [
        "The Archivist",
        "Defeat Avalon in the Cursed Library!",
        [
          "images/quests/standart/cursedlibrary.png",
          "images/quests/standart/cursedlibrary.png",
          "images/quests/standart/cursedlibrary.png",
          "images/quests/standart/cursedlibrary.png",
          "images/quests/standart/cursedlibrary.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      9: [
        "The Apparition",
        "Defeat the Ghost of Skuld in the Haunted Cemetery.",
        [
          "images/quests/standart/hauntedcemetery.png",
          "images/quests/standart/hauntedcemetery.png",
          "images/quests/standart/hauntedcemetery.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      10: [
        "The Vampire Lord",
        "Defeat Lord Ruthven in the Manor of the Immortals.",
        [
          "images/quests/standart/manor.png",
          "images/quests/standart/manor.png",
          "images/quests/standart/manor.png",
          "images/quests/standart/manor.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      11: [
        "The Mad Scientist",
        "Defeat Dr. Terrible in the Mad Lab.",
        [
          "images/quests/standart/madlab.png",
          "images/quests/standart/madlab.png",
          "images/quests/standart/madlab.png",
          "images/quests/standart/madlab.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      12: [
        "To the Mountains!",
        "Head to the mountains to take down Oryx’s generals!",
        [
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/madlab.png",
          "images/quests/standart/puppettheater.png",
          "images/quests/standart/hauntedcemetery.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      13: [
        "Smite the Undead!",
        "Put these ones back in their graves, would ya?",
        [
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/hauntedcemetery.png",
          "images/quests/standart/hauntedcemetery.png",
          "images/quests/standart/manor.png",
          "images/quests/standart/manor.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      14: [
        "As Above, So Below",
        "Take to the skies and sink to the depths for this quest!",
        [
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/toxicsewers.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      15: [
        "Blessings and Curses",
        "Life is all about balance, wouldn’t you agree?",
        [
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/cursedlibrary.png",
          "images/quests/standart/cursedlibrary.png",
          "images/quests/standart/cursedlibrary.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      16: [
        "Demonhunter",
        "I don’t think Holy Water will cut it for these ones!",
        [
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/abyss.png",
          "images/quests/standart/mountaintemple.png",
          "images/quests/standart/mountaintemple.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      17: [
        "That’s the Spirit",
        "All sorts of ghouls lurk in the realm, some more frightening than others!",
        [
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/magicwoods.png",
          "images/quests/standart/hauntedcemetery.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      18: [
        "Rainbow Road",
        "Bring me some marks while you search for stat potions!",
        [
          "images/quests/standart/undeadlair.png",
          "images/quests/standart/spriteworld.png",
          "images/quests/standart/toxicsewers.png",
          "images/quests/standart/abyss.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ],
      19: [
        "The Cost of Wisdom",
        "I was never the most book smart, but there’s still time for you!",
        [
          "images/quests/standart/madlab.png",
          "images/quests/standart/madlab.png",
          "images/quests/standart/cursedlibrary.png",
          "images/quests/standart/cursedlibrary.png"
        ],
        ["images/quests/rewards/standartchest.png"]
      ]
    },
    "Mighty Quests": {
      1: [
        "The Effigy",
        "Defeat the Golden Oryx Effigy in the Cave of a Thousand Treasures.",
        ["images/quests/standart/effigy.png"],
        [
          "images/quests/rewards/mightychest.png",
          "images/quests/rewards/lootdroppotion.png",
          "images/quests/rewards/loottierpotion.png"
        ]
      ],
      2: [
        "The New King",
        "Defeat Jon Bilgewater in the Deadwater Docks.",
        [
          "images/quests/mighty/deadwaterdocks.png",
          "images/quests/mighty/deadwaterdocks.png",
          "images/quests/mighty/deadwaterdocks.png",
          "images/quests/mighty/deadwaterdocks.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      3: [
        "The Megamoth",
        "Defeat the Murderous Megamoth in the Woodland Labyrinth.",
        [
          "images/quests/mighty/woodlandlabyrinth.png",
          "images/quests/mighty/woodlandlabyrinth.png",
          "images/quests/mighty/woodlandlabyrinth.png",
          "images/quests/mighty/woodlandlabyrinth.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      4: [
        "The Prodigal Son",
        "Defeat the Son of Arachna in the Crawling Depths.",
        [
          "images/quests/mighty/crawlingdepths.png",
          "images/quests/mighty/crawlingdepths.png",
          "images/quests/mighty/crawlingdepths.png",
          "images/quests/mighty/crawlingdepths.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      5: [
        "The Mermaid Goddess",
        "Defeat Thessal the Mermaid Goddess in the Ocean Trench.",
        [
          "images/quests/mighty/oceantrench.png",
          "images/quests/mighty/oceantrench.png",
          "images/quests/mighty/oceantrench.png",
          "images/quests/mighty/oceantrench.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      6: [
        "The Nightmare",
        "Defeat the Nightmare Colony in the Parasite Chambers.",
        [
          "images/quests/mighty/parasitechambers.png",
          "images/quests/mighty/parasitechambers.png",
          "images/quests/mighty/parasitechambers.png",
          "images/quests/mighty/parasitechambers.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      7: [
        "The Ghost Pirate",
        "Defeat Davy Jones on his Ghost Ship.",
        [
          "images/quests/mighty/davyjones.png",
          "images/quests/mighty/davyjones.png",
          "images/quests/mighty/davyjones.png",
          "images/quests/mighty/davyjones.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      8: [
        "The Elemental Wyvern",
        "Defeat the Ivory Wyvern in the Lair of Draconis.",
        [
          "images/quests/mighty/lairdraconis.png",
          "images/quests/mighty/lairdraconis.png",
          "images/quests/mighty/lairdraconis.png",
          "images/quests/mighty/lairdraconis.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      9: [
        "The Fallen",
        "Defeat Daichi in the Mountain Temple.",
        [
          "images/quests/mighty/mountaintemple.png",
          "images/quests/mighty/mountaintemple.png",
          "images/quests/mighty/mountaintemple.png",
          "images/quests/mighty/mountaintemple.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      10: [
        "The Unwilling",
        "Defeat Esben the Unwilling in the Ice Cave.",
        [
          "images/quests/mighty/icecave.png",
          "images/quests/mighty/icecave.png",
          "images/quests/mighty/icecave.png",
          "images/quests/mighty/icecave.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      11: [
        "The Ancients",
        "Defeat Geb in the Tomb of the Ancients.",
        [
          "images/quests/mighty/tomb.png",
          "images/quests/mighty/tomb.png",
          "images/quests/mighty/tomb.png",
          "images/quests/mighty/tomb.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      12: [
        "The Mad God",
        "Defeat Oryx the Mad God in his chamber.",
        [
          "images/quests/mighty/oryx.png",
          "images/quests/mighty/oryx.png",
          "images/quests/mighty/oryx.png",
          "images/quests/mighty/oryx.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      13: [
        "The Doorwarden",
        "Defeat Janus the Doorwarden in Oryx’s Castle.",
        [
          "images/quests/mighty/janus.png",
          "images/quests/mighty/janus.png",
          "images/quests/mighty/janus.png",
          "images/quests/mighty/janus.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      14: [
        "Double Trouble",
        "Put a stop to Oryx and his Doorwarden!",
        [
          "images/quests/mighty/oryx.png",
          "images/quests/mighty/oryx.png",
          "images/quests/mighty/oryx.png",
          "images/quests/mighty/janus.png",
          "images/quests/mighty/janus.png",
          "images/quests/mighty/janus.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      15: [
        "Epic Showdown",
        "Slay Jon Bilgewater, the Son of Arachna, and the Murderous Megamoth to be rewarded.",
        [
          "images/quests/mighty/deadwaterdocks.png",
          "images/quests/mighty/deadwaterdocks.png",
          "images/quests/mighty/crawlingdepths.png",
          "images/quests/mighty/crawlingdepths.png",
          "images/quests/mighty/woodlandlabyrinth.png",
          "images/quests/mighty/woodlandlabyrinth.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      16: [
        "Exterminate!",
        "Get rid of those overgrown insects!",
        [
          "images/quests/mighty/crawlingdepths.png",
          "images/quests/mighty/crawlingdepths.png",
          "images/quests/mighty/woodlandlabyrinth.png",
          "images/quests/mighty/woodlandlabyrinth.png",
          "images/quests/epic/nest.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      17: [
        "Unsettling Foes",
        "Defeat these creepy combatants for a prize!",
        [
          "images/quests/mighty/parasitechambers.png",
          "images/quests/mighty/parasitechambers.png",
          "images/quests/mighty/icecave.png",
          "images/quests/mighty/davyjones.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      18: [
        "Long Forgotten",
        "Many forgot about these ancient foes. Aye, but not me!",
        [
          "images/quests/mighty/icecave.png",
          "images/quests/mighty/icecave.png",
          "images/quests/mighty/tomb.png",
          "images/quests/mighty/tomb.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      19: [
        "Thar be Pirates!",
        "Avast! Clear out the pirate presence in the realm!",
        [
          "images/quests/mighty/deadwaterdocks.png",
          "images/quests/mighty/deadwaterdocks.png",
          "images/quests/mighty/davyjones.png",
          "images/quests/mighty/davyjones.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      20: [
        "Lost and Found",
        "People say some things are best left forgotten. I heartily disagree!",
        [
          "images/quests/mighty/parasitechambers.png",
          "images/quests/mighty/lairdraconis.png",
          "images/quests/mighty/davyjones.png",
          "images/quests/mighty/tomb.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ],
      21: [
        "Ocean Man",
        "With how vast the realm is, you’d think Oryx wouldn’t care for the high seas.",
        [
          "images/quests/mighty/oceantrench.png",
          "images/quests/mighty/oceantrench.png",
          "images/quests/mighty/davyjones.png",
          "images/quests/mighty/deadwaterdocks.png"
        ],
        ["images/quests/rewards/mightychest.png"]
      ]
    },
    "Epic Quests": {
      1: [
        "",
        "",
        [
          "images/quests/standart/nest.png",
          "images/quests/standart/nest.png",
          "images/quests/standart/nest.png"
        ],
        [
          "images/quests/rewards/BIGchest.png",
          "images/quests/rewards/clover.png"
        ]
      ],
      2: [
        "",
        "",
        [
          "images/quests/standart/shatters.png",
          "images/quests/standart/shatters.png",
          "images/quests/standart/shatters.png"
        ],
        [
          "images/quests/rewards/BIGchest.png",
          "images/quests/rewards/clover.png"
        ]
      ],
      3: [
        "",
        "",
        [
          "images/quests/standart/losthalls.png",
          "images/quests/standart/losthalls.png",
          "images/quests/standart/losthalls.png"
        ],
        [
          "images/quests/rewards/BIGchest.png",
          "images/quests/rewards/clover.png"
        ]
      ],
      4: [
        "",
        "",
        [
          "images/quests/standart/cultisthideout.png",
          "images/quests/standart/cultisthideout.png",
          "images/quests/standart/cultisthideout.png"
        ],
        [
          "images/quests/rewards/BIGchest.png",
          "images/quests/rewards/clover.png"
        ]
      ],
      5: [
        "",
        "",
        [
          "images/quests/standart/void.png",
          "images/quests/standart/void.png",
          "images/quests/standart/void.png"
        ],
        [
          "images/quests/rewards/BIGchest.png",
          "images/quests/rewards/clover.png"
        ]
      ],
      6: [
        "",
        "",
        [
          "images/quests/standart/crystal.png",
          "images/quests/standart/crystal.png",
          "images/quests/standart/crystal.png"
        ],
        [
          "images/quests/rewards/BIGchest.png",
          "images/quests/rewards/clover.png"
        ]
      ],
      7: [
        "",
        "",
        [
          "images/quests/standart/losthalls.png",
          "images/quests/standart/losthalls.png",
          "images/quests/standart/cultisthideout.png",
          "images/quests/standart/cultisthideout.png"
        ],
        [
          "images/quests/rewards/BIGchest.png",
          "images/quests/rewards/clover.png"
        ]
      ]
    }
  };

  dailyTracker() {
    List<Widget> tracking = [];
    if (dailiesSettings['craft']) {
      bool _itemColor1 = false;
      Map craft = {
        1: [
          "Title",
          "Description",
          [
            "images/quests/beginner/piratecave.png",
            "images/quests/beginner/piratecave.png",
            "images/quests/beginner/piratecave.png",
            "images/quests/beginner/piratecave.png"
          ],
          ["images/quests/rewards/beginnerchest.png"]
        ]
      };
      for (var d = 1; d <= craft.length; d++) {
        tracking.add(Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Text(
                craft[d][0],
                style: TextStyle(
                    color: settings['secondaryColor'],
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                craft[d][1],
                style: TextStyle(
                    color: settings['secondaryColor'],
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Requirements:",
                style: TextStyle(
                    color: settings['secondaryColor'],
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  width: 45,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            _itemColor1 ? Colors.green[700] : Colors.red[700]),
                    color: _itemColor1 ? Colors.green[300] : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (_itemColor1) {
                          setState(() {
                            _itemColor1 = false;
                          });
                        } else {
                          setState(() {
                            _itemColor1 = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(child: Image.asset(craft[d][2][0]))),
                ),
                if (craft[d][2].length > 1) Image.asset(craft[d][2][1]),
                if (craft[d][2].length > 2) Image.asset(craft[d][2][2]),
                if (craft[d][2].length > 3) Image.asset(craft[d][2][3]),
                if (craft[d][2].length > 4) Image.asset(craft[d][2][4]),
                if (craft[d][2].length > 5) Image.asset(craft[d][2][5]),
                if (craft[d][2].length > 6) Image.asset(craft[d][2][6]),
                if (craft[d][2].length > 7) Image.asset(craft[d][2][7]),
              ]),
              SizedBox(
                height: 10,
              ),
              Text(
                "Rewards:",
                style: TextStyle(
                    color: settings['secondaryColor'],
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 12),
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(craft[d][3][0]),
                if (craft[d][3].length > 1) Image.asset(craft[d][3][1]),
                if (craft[d][3].length > 2) Image.asset(craft[d][3][2]),
              ]),
            ],
          ),
        ));
      }
    }
    return tracking;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: dailyTracker().length,
          itemBuilder: (context, index) {
            return Column(
              children: dailyTracker(),
            );
          }),
    );
  }
}
