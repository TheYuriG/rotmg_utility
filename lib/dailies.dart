import 'package:flutter/material.dart';
import 'data.dart';

class Dailies extends StatefulWidget {
  Dailies({Key key}) : super(key: key);

  @override
  _DailiesState createState() => _DailiesState();
}

//? Esse mapa guarda a informação de settings em relação ao que o usuário quer mostrar ou ignorar.
//? Ele pode ser alterado pelo endDrawer que você ativa apertando o botão de action na appBar ou puxando a lateral direita da tela.
Map<String, bool> dailiesSettings = {
  "craft": true,
  "beginner": true,
  "scout": true,
  "standart": true,
  "mighty": true,
  "epic": true,
  "listMode": false,
};

//? Essa lista guarda as quests removidas manualmente pelo usuário clicando no botão X de cada item da lista.
//? Essa lista pode ser reiniciada caso o usuário aperte o botão de lista na appBar.
List filteredQuests = [];

//? Esse mapa guarda os estados dos icones ativos/inativos. O criador de itens trabalha com atenção pra valor nulo
//? portanto vai ler valores nulos como valores falsos. Esse mapa é reiniciado caso o usuário clique
//? no botão de reinício da appBar.
Map checkedTracker = {};

class _DailiesState extends State<Dailies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //? o endDrawer é responsável por organizar os filtros dessa página.
      //? Ele pode ser acessado puxando a lateral direita da página ou apertando o botão de settings na appBar
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
        centerTitle:
            true, //? Centraliza o título considerando o espaço total da appBar, ao invés de usar apenas o tamanho restante padrão
        backgroundColor: settings['primaryColor'],
        elevation:
            0, //? remove a sombra do fundo que dá impressão da appBar estar acima do resto do conteudo.
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
          //? Esse botão alterna entre o modo lista e o modo completo.
          Tooltip(
            message: 'Toogle !List Mode" to filter all quests faster',
            child: IconButton(
                icon: Icon(
                  Icons.list,
                  size: 30,
                  color: settings['secondaryColor'],
                ),
                onPressed: () {
                  if (dailiesSettings['listMode']) {
                    setState(() {
                      dailiesSettings['listMode'] = false;
                    });
                  } else {
                    setState(() {
                      dailiesSettings['listMode'] = true;
                    });
                  }
                }),
          ),
          // if (filteredQuests.isNotEmpty)
          //? Esse botão restaura as quests removidas usando o botão X no canto superior direito de cada quest
          //? Gostaria de fazer que esse botão aparecesse apenas quando o usuário tiver removido alguma quest
          //? Essa informação está disponível puxando o tamanho da lista "filteredQuests"
          //? mas por qualquer motivo, a appBar não se reconstroi quando o usuário remove um dos items e altera a lista
          Tooltip(
            message: "Restore all removed quests",
            child: IconButton(
                icon: Icon(
                  Icons.check,
                  size: 30,
                  color: settings['secondaryColor'],
                ),
                onPressed: () {
                  setState(() {
                    filteredQuests = [];
                  });
                }),
          ),
          //? Esse botão deseleciona todos os requisitos marcados.
          //? Gostaria que esse botão aparecesse apenas quando o usuário marcasse um botão, mas encontro o mesmo problema de cima.
          Tooltip(
            message: "Reset all trackers",
            child: IconButton(
                icon: Icon(
                  Icons.fiber_new,
                  color: settings['secondaryColor'],
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    checkedTracker = {};
                  });
                }),
          ),
          //? Esse botão mostra o menu de filtragem de quests por tipo usando o endDrawer.
          Builder(builder: (context) {
            return Tooltip(
              message: "Filter which quest type you wish to display",
              child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: settings['secondaryColor'],
                    size: 30,
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer()),
            );
          })
        ],
      ),
      backgroundColor: settings['primaryColor'],
      body: DailyBody(
          context), //? por questão de organização, o corpo dessa página é delegado pra outra classe se responsabilizar.
    );
  }
}

class DailyBody extends StatefulWidget {
  DailyBody(BuildContext context, {Key key}) : super(key: key);

  @override
  _DailyBodyState createState() => _DailyBodyState();
}

class _DailyBodyState extends State<DailyBody> {
  //? Essa lista junta todos os itens que serão renderizados, baseado nas configurações selecionadas pelo usuário.
  List<Widget> tracking = [];

  //?/ Essa é a função responsável por popular o corpo da página.
  List<Widget> dailyTracker() {
    tracking = [];
    //? Essa função é responsável por popular a lista "tracking"
    //? e é chamada dentro de cada bloco "if", baseado nas configurações do usuário.
    //? craft é o Mapa com todas as informações relevantes a quest (exceto nome da marca/localização)
    //? divider é um número inteiro usado pra dar nomes diferentes pra cada imagem e marcação,
    //? de forma que cada item tenha uma ID única pra quando as marcas forem clicadas.
    void generate(Map craft, int divider) {
      for (var d = 1; d <= craft.length; d++) {
        if (filteredQuests.contains(craft[d][0])) {
          continue;
        }
        tracking.add(Container(
          width: MediaQuery.of(context).size.width,
          // padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: settings['secondaryColor']),
              color: settings['primaryColor'],
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    color: settings['secondaryColor'],
                    offset: Offset(0, 3),
                    blurRadius: 4)
              ]),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                color: settings['secondaryColor'],
                child: Stack(children: [
                  Center(
                    child: Text(
                      craft[d][0],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "PS2P",
                          fontSize: 20),
                    ),
                  ),
                  Positioned(
                      top: -2.5,
                      right: 5,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        width: 20,
                        height: 20,
                        child: IconButton(
                          splashColor: Colors.transparent,
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            setState(() {
                              filteredQuests.add(craft[d][0]);
                            });
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: settings['primaryColor'],
                          ),
                        ),
                      ))
                ]),
              ),
            ),
            if (!dailiesSettings['listMode'])
              SizedBox(
                height: 10,
              ),
            if (!dailiesSettings['listMode'])
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  craft[d][1],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: settings['secondaryColor'],
                      fontWeight: FontWeight.bold,
                      fontFamily: "PS2P",
                      fontSize: 14),
                ),
              ),
            if (!dailiesSettings['listMode'])
              SizedBox(
                height: 10,
              ),
            if (!dailiesSettings['listMode'])
              Text(
                "Requirements:",
                style: TextStyle(
                    color: settings['secondaryColor'],
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 12),
              ),
            if (!dailiesSettings['listMode'])
              SizedBox(
                height: 10,
              ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 50, //? tamanho para padronizar todos os botões
                margin: EdgeInsets.symmetric(
                    horizontal: 5), //? tamanho para afastar os botões
                padding: EdgeInsets.only(
                    left: craft[d][2][0].contains("quest")
                        ? 5
                        : 0, //? as imagens de marca não são
                    //? perfeitamente centralizadas, então essa função terciaria vai centralizar
                    //? as marcas e ignorar o resto
                    top: 3,
                    bottom: 3),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3,
                      color: checkedTracker["${divider}craft${d}IMG1"] ?? false
                          ? Colors.green[700]
                          : Colors.red[700]),
                  //? a cor interna e a cor da borda da imagem mudam com o clique para sinalizar que o item foi marcado
                  color: checkedTracker["${divider}craft${d}IMG1"] ?? false
                      ? Colors.green[300]
                      : Colors.red[300],
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: RawMaterialButton(
                    onPressed: () {
                      //? essa função colore a moldura da imagem e guarda o valor
                      //? dentro da lista "checkedTracker", para que essa lista possa
                      //? ser reiniciada pelo botão da appBar, caso o usuário queira
                      if (checkedTracker["${divider}craft${d}IMG1"] ?? false) {
                        setState(() {
                          checkedTracker["${divider}craft${d}IMG1"] = false;
                        });
                      } else {
                        setState(() {
                          checkedTracker["${divider}craft${d}IMG1"] = true;
                        });
                      }
                    },
                    //? shrinkwrap encolhe o botão para que ele não fique desnecessariamente grande (o que é o padrão)
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Center(child: Image.asset(craft[d][2][0]))),
              ),
              if (craft[d][2].length > 1)
                Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(
                      left: craft[d][2][1].contains("quest") ? 5 : 0,
                      top: 3,
                      bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            checkedTracker["${divider}craft${d}IMG2"] ?? false
                                ? Colors.green[700]
                                : Colors.red[700]),
                    color: checkedTracker["${divider}craft${d}IMG2"] ?? false
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (checkedTracker["${divider}craft${d}IMG2"] ??
                            false) {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG2"] = false;
                          });
                        } else {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG2"] = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(child: Image.asset(craft[d][2][1]))),
                ),
              if (craft[d][2].length > 2)
                Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(
                      left: craft[d][2][2].contains("quest") ? 5 : 0,
                      top: 3,
                      bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            checkedTracker["${divider}craft${d}IMG3"] ?? false
                                ? Colors.green[700]
                                : Colors.red[700]),
                    color: checkedTracker["${divider}craft${d}IMG3"] ?? false
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (checkedTracker["${divider}craft${d}IMG3"] ??
                            false) {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG3"] = false;
                          });
                        } else {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG3"] = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(
                        child: Image.asset(craft[d][2][2]),
                      )),
                ),
              if (craft[d][2].length > 3)
                Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(
                      left: craft[d][2][3].contains("quest") ? 5 : 0,
                      top: 3,
                      bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            checkedTracker["${divider}craft${d}IMG4"] ?? false
                                ? Colors.green[700]
                                : Colors.red[700]),
                    color: checkedTracker["${divider}craft${d}IMG4"] ?? false
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (checkedTracker["${divider}craft${d}IMG4"] ??
                            false) {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG4"] = false;
                          });
                        } else {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG4"] = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(
                        child: Image.asset(craft[d][2][3]),
                      )),
                ),
              if (craft[d][2].length > 4)
                Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(
                      left: craft[d][2][4].contains("quest") ? 5 : 0,
                      top: 3,
                      bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            checkedTracker["${divider}craft${d}IMG5"] ?? false
                                ? Colors.green[700]
                                : Colors.red[700]),
                    color: checkedTracker["${divider}craft${d}IMG5"] ?? false
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (checkedTracker["${divider}craft${d}IMG5"] ??
                            false) {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG5"] = false;
                          });
                        } else {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG5"] = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(
                        child: Image.asset(craft[d][2][4]),
                      )),
                ),
              if (craft[d][2].length > 5)
                Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(
                      left: craft[d][2][5].contains("quest") ? 5 : 0,
                      top: 3,
                      bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            checkedTracker["${divider}craft${d}IMG6"] ?? false
                                ? Colors.green[700]
                                : Colors.red[700]),
                    color: checkedTracker["${divider}craft${d}IMG6"] ?? false
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (checkedTracker["${divider}craft${d}IMG6"] ??
                            false) {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG6"] = false;
                          });
                        } else {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG6"] = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(
                        child: Image.asset(craft[d][2][5]),
                      )),
                ),
              if (craft[d][2].length > 6)
                Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(
                      left: craft[d][2][6].contains("quest") ? 5 : 0,
                      top: 3,
                      bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            checkedTracker["${divider}craft${d}IMG7"] ?? false
                                ? Colors.green[700]
                                : Colors.red[700]),
                    color: checkedTracker["${divider}craft${d}IMG7"] ?? false
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (checkedTracker["${divider}craft${d}IMG7"] ??
                            false) {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG7"] = false;
                          });
                        } else {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG7"] = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(
                        child: Image.asset(craft[d][2][6]),
                      )),
                ),
              if (craft[d][2].length > 7)
                Container(
                  width: 50,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.only(
                      left: craft[d][2][7].contains("quest") ? 5 : 0,
                      top: 3,
                      bottom: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color:
                            checkedTracker["${divider}craft${d}IMG8"] ?? false
                                ? Colors.green[700]
                                : Colors.red[700]),
                    color: checkedTracker["${divider}craft${d}IMG8"] ?? false
                        ? Colors.green[300]
                        : Colors.red[300],
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: RawMaterialButton(
                      onPressed: () {
                        if (checkedTracker["${divider}craft${d}IMG8"] ??
                            false) {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG8"] = false;
                          });
                        } else {
                          setState(() {
                            checkedTracker["${divider}craft${d}IMG8"] = true;
                          });
                        }
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Center(
                        child: Image.asset(craft[d][2][7]),
                      )),
                ),
            ]),
            if (!dailiesSettings['listMode'])
              SizedBox(
                height: 10,
              ),
            if (!dailiesSettings['listMode'])
              Text(
                "Rewards:",
                style: TextStyle(
                    color: settings['secondaryColor'],
                    fontWeight: FontWeight.bold,
                    fontFamily: "PS2P",
                    fontSize: 12),
              ),
            if (!dailiesSettings['listMode'])
              Row(mainAxisSize: MainAxisSize.min, children: [
                Image.asset(craft[d][3][0]),
                if (craft[d][3].length > 1) Image.asset(craft[d][3][1]),
                if (craft[d][3].length > 2) Image.asset(craft[d][3][2]),
              ]),
            if (!dailiesSettings['listMode'])
              SizedBox(
                height: 5,
              ),
          ]),
        ));
      }
    }

    if (dailiesSettings['craft']) {
      //? todos os Mapas que guardam informação de quest seguem o seguinte padrão:
      //? {numero: [titulo, descrição, Lista de requisitos, Lista de recompensas]}
      Map quests = {
        1: [
          "Eggs for Breakfast",
          "You’ve got to crack a few eggs to make an omelette!",
          [
            "images/eggs/cexotic.png",
            "images/eggs/creptile.png",
            "images/eggs/cautomaton.png",
          ],
          ["images/quests/craft/omelette.png"]
        ],
        2: [
          "Eggs for Lunch",
          "You’ve got to crack a few eggs to make an omelette!",
          [
            "images/eggs/cfeline.png",
            "images/eggs/ccanine.png",
            "images/eggs/caquatic.png",
          ],
          ["images/quests/craft/omelette.png"]
        ],
        3: [
          "Eggs for Dinner",
          "You’ve got to crack a few eggs to make an omelette!",
          [
            "images/eggs/chumanoid.png",
            "images/eggs/cavian.png",
            "images/eggs/cfarm.png",
          ],
          ["images/quests/craft/omelette.png"]
        ],
        4: [
          "Clean Laundry",
          "I can wash your dyed clothes with the right materials.",
          [
            "images/pots/spdpot.png",
            "images/pots/dexpot.png",
            "images/pots/wispot.png",
            "images/pots/vitpot.png",
            "images/pots/holywater.png"
          ],
          [
            "images/quests/craft/clothingdyeremover.png",
            "images/quests/craft/accessorydyeremover.png"
          ]
        ],
        5: [
          "Potion Fusion: Speed",
          "It doesn’t take an alchemist to put a few potions in the same vial! (Repeatable)",
          [
            "images/pots/spdpot.png",
            "images/pots/spdpot.png",
            "images/pots/spdpot.png",
          ],
          ["images/pots/gspdpot.png"]
        ],
        6: [
          "Potion Fusion: Dexterity",
          "It doesn’t take an alchemist to put a few potions in the same vial! (Repeatable)",
          [
            "images/pots/dexpot.png",
            "images/pots/dexpot.png",
            "images/pots/dexpot.png",
          ],
          ["images/pots/gdexpot.png"]
        ],
        7: [
          "Potion Fusion: Wisdom",
          "It doesn’t take an alchemist to put a few potions in the same vial! (Repeatable)",
          [
            "images/pots/wispot.png",
            "images/pots/wispot.png",
            "images/pots/wispot.png",
          ],
          ["images/pots/gwispot.png"]
        ],
        8: [
          "Potion Fusion: Attack",
          "It doesn’t take an alchemist to put a few potions in the same vial! (Repeatable)",
          [
            "images/pots/atkpot.png",
            "images/pots/atkpot.png",
            "images/pots/atkpot.png",
          ],
          ["images/pots/gatkpot.png"]
        ],
        9: [
          "Potion Fusion: Vitality",
          "It doesn’t take an alchemist to put a few potions in the same vial! (Repeatable)",
          [
            "images/pots/vitpot.png",
            "images/pots/vitpot.png",
            "images/pots/vitpot.png",
          ],
          ["images/pots/gvitpot.png"]
        ],
        10: [
          "Potion Fusion: Defense",
          "It doesn’t take an alchemist to put a few potions in the same vial! (Repeatable)",
          [
            "images/pots/defpot.png",
            "images/pots/defpot.png",
            "images/pots/defpot.png",
          ],
          ["images/pots/gdefpot.png"]
        ],
      };
      generate(quests, 0);
    }
    if (dailiesSettings['beginner']) {
      Map quests = {
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
            "images/quests/beginner/forbiddenjungle.png",
            "images/quests/beginner/hive.png"
          ],
          [
            "images/quests/rewards/beginnerchest.png",
            "images/quests/rewards/treasuremap.png"
          ]
        ]
      };
      generate(quests, 1);
    }
    if (dailiesSettings['scout']) {
      Map quests = {
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
      };
      generate(quests, 2);
    }
    if (dailiesSettings['standart']) {
      Map quests = {
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
            "images/quests/mighty/mountaintemple.png",
            "images/quests/mighty/mountaintemple.png"
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
      };
      generate(quests, 3);
    }
    if (dailiesSettings['mighty']) {
      Map quests = {
        1: [
          "The Effigy",
          "Defeat the Golden Oryx Effigy in the Cave of a Thousand Treasures.",
          ["images/quests/mighty/treasurecave.png"],
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
      };
      generate(quests, 5);
    }
    if (dailiesSettings['epic']) {
      Map quests = {
        1: [
          "The Killer Queen",
          "Defeat the Killer Bee Queen in the Nest.",
          [
            "images/quests/epic/nest.png",
            "images/quests/epic/nest.png",
            "images/quests/epic/nest.png"
          ],
          [
            "images/quests/rewards/honeyepicchest.png",
            "images/quests/rewards/clover.png"
          ]
        ],
        2: [
          "The King",
          "Defeat the Forgotten King in the Shatters.",
          [
            "images/quests/epic/shatters.png",
            "images/quests/epic/shatters.png",
            "images/quests/epic/shatters.png"
          ],
          [
            "images/quests/rewards/royalepicchest.png",
            "images/quests/rewards/clover.png"
          ]
        ],
        3: [
          "The Colossus",
          "Defeat the Marble Colossus in the Lost Halls.",
          [
            "images/quests/epic/losthalls.png",
            "images/quests/epic/losthalls.png",
            "images/quests/epic/losthalls.png"
          ],
          [
            "images/quests/rewards/marbleepicchest.png",
            "images/quests/rewards/clover.png"
          ]
        ],
        4: [
          "The Cultist",
          "Defeat Malus in the Cultist Hideout.",
          [
            "images/quests/epic/cultisthideout.png",
            "images/quests/epic/cultisthideout.png",
            "images/quests/epic/cultisthideout.png"
          ],
          [
            "images/quests/rewards/cultistepicchest.png",
            "images/quests/rewards/clover.png"
          ]
        ],
        5: [
          "The End",
          "Defeat the Void Entity in the Void.",
          [
            "images/quests/epic/void.png",
            "images/quests/epic/void.png",
            "images/quests/epic/void.png"
          ],
          [
            "images/quests/rewards/voidepicchest.png",
            "images/quests/rewards/clover.png"
          ]
        ],
        6: [
          "The Crystal",
          "Defeat the Crystal Entity in the Crystal Cavern.",
          [
            "images/quests/epic/crystal.png",
            "images/quests/epic/crystal.png",
            "images/quests/epic/crystal.png"
          ],
          [
            "images/quests/rewards/crystalepicchest.png",
            "images/quests/rewards/clover.png"
          ]
        ],
        7: [
          "Havoc in the Halls",
          "Take down Malus and the Marble Colossus for otherworldly rewards!",
          [
            "images/quests/epic/losthalls.png",
            "images/quests/epic/losthalls.png",
            "images/quests/epic/cultisthideout.png",
            "images/quests/epic/cultisthideout.png"
          ],
          [
            "images/quests/rewards/voidepicchest.png",
            "images/quests/rewards/clover.png"
          ]
        ]
      };

      generate(quests, 6);
    }
    if (tracking.length == 0) {
      tracking.add(
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(20),
          child: Center(
            child: RawMaterialButton(
              onPressed: () {
                setState(() {
                  dailiesSettings = {
                    "craft": true,
                    "beginner": true,
                    "scout": true,
                    "standart": true,
                    "mighty": true,
                    "epic": true,
                    "listMode": false,
                  };
                  filteredQuests = [];
                });
              },
              child: Container(
                child: Text(
                  "You overdid on the filters and now there is nothing left to display!\nClick here if you wish to reset all filters instantly and display everything again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: settings['secondaryColor'],
                      fontWeight: FontWeight.bold,
                      fontFamily: "PS2P",
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return tracking;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: dailyTracker().length,
          itemBuilder: (context, index) {
            return tracking[index];
          }),
    );
  }
}
