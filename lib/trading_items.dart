import 'dart:async';
import 'package:flutter/material.dart';
import 'data.dart';
import 'specific_item.dart';
import 'main.dart';

// Lists all items fetched by the search request.
Map<int, Map<String, String>> allOffers = {};

// ignore: must_be_immutable
class TradingItems extends StatefulWidget {
  TradingItems({Key key}) : super(key: key);

  @override
  _TradingItemsState createState() => _TradingItemsState();
}

class _TradingItemsState extends State<TradingItems> {
  Future<List<Widget>> renderItems() async {
    Future<Map> _scrapeOffers() async {
      // This is meant to be initial value so the app force renders something while it waits for the web requests to finish
      Map<String, dynamic> updatedOffers = {};
      // O IF statement abaixo conecta com a página e, em caso de sucesso, puxa informações de itens a venda e a serem comprados
      if (await webScraper.loadWebPage('/current-offers/')) {
        // Itens sendo vendidos
        sellingItems = webScraper.getElement(
          'div.current-offers > span > a.item-selling',
          ['title', 'href'],
        );
        // Itens a serem comprados
        buyingItems = webScraper.getElement(
          'div.current-offers > span > a.item-buying',
          ['title', 'href'],
        );
        // O FOR IN loop abaixo vai pegar todos os itens sendo vendidos e organizar no mapa updatedOffers.
        for (Map item in sellingItems) {
          updatedOffers.addAll({
            item["attributes"]["title"].replaceAll('Offers to sell ', ''): {
              'sellNumber': item['title'],
              'sellLink': item["attributes"]["href"],
              'buyNumber': null,
              'buyLink': null
            }
          });
        }
        // O FOR IN loop abaixo vai pegar todos os itens que precisam de um vendedor e reiterar no mapa updatedOffers.
        for (Map item in buyingItems) {
          String itemName =
              item["attributes"]["title"].replaceAll('Offers to buy ', '');
          // checando se esse item existe no mapa updatedOffers
          if (updatedOffers.containsKey(itemName)) {
            // se o item existe, as propriedades de compra são adicionadas
            updatedOffers[itemName]["buyNumber"] = item['title'];
            updatedOffers[itemName]["buyLink"] = item["attributes"]["href"];
          } else {
            // se o item não existe, as propriedades de venda são marcadas como nulas e as propriedades de compra são adicionadas
            // quando essa função foi escrita, ainda não tinha feito o UI que puxaria os itens e tinha a intenção de checar
            // por nulo para decidir se vamos construir ou não os itens na UI.
            updatedOffers.addAll({
              item["attributes"]["title"].replaceAll('Offers to buy ', ''): {
                'sellNumber': null,
                'sellLink': null,
                'buyNumber': item['title'],
                'buyLink': item["attributes"]["href"]
              }
            });
          }
        }
      }
      return updatedOffers;
    }

    final data = await _scrapeOffers();

    List<Widget> displayItems = [];
    if (settings['pots']) {
      for (List<String> pot in renderPotions) {
        if (data.containsKey(pot[0])) {
          displayItems
              .add(_addItem(pot, data[pot[0]], settings['secondaryColor']));
          if (data[pot[0]]['buyLink'] != null) {
            allOffers[int.parse(
                data[pot[0]]['buyLink'].replaceAll('/offers-to/buy/', ''))] = {
              'name': pot[0],
              'imageLocation': pot[1]
            };
          } else if (data[pot[0]]['sellLink'] != null) {
            allOffers[int.parse(data[pot[0]]['sellLink']
                .replaceAll('/offers-to/sell/', ''))] = {
              'name': pot[0],
              'imageLocation': pot[1]
            };
          }
        }
      }
    }

    if (settings['weapons']) {
      for (List<String> weapon in renderWeapons) {
        if (data.containsKey(weapon[0])) {
          displayItems.add(
              _addItem(weapon, data[weapon[0]], settings['secondaryColor']));

          if (data[weapon[0]]['buyLink'] != null) {
            allOffers[int.parse(data[weapon[0]]['buyLink']
                .replaceAll('/offers-to/buy/', ''))] = {
              'name': weapon[0],
              'imageLocation': weapon[1]
            };
          } else if (data[weapon[0]]['sellLink'] != null) {
            allOffers[int.parse(data[weapon[0]]['sellLink']
                .replaceAll('/offers-to/sell/', ''))] = {
              'name': weapon[0],
              'imageLocation': weapon[1]
            };
          }
        }
      }
    }

    if (settings['class']) {
      for (List<String> classItem in renderClassItems) {
        if (data.containsKey(classItem[0])) {
          displayItems.add(_addItem(
              classItem, data[classItem[0]], settings['secondaryColor']));
          if (data[classItem[0]]['buyLink'] != null) {
            allOffers[int.parse(data[classItem[0]]['buyLink']
                .replaceAll('/offers-to/buy/', ''))] = {
              'name': classItem[0],
              'imageLocation': classItem[1]
            };
          } else if (data[classItem[0]]['sellLink'] != null) {
            allOffers[int.parse(data[classItem[0]]['sellLink']
                .replaceAll('/offers-to/sell/', ''))] = {
              'name': classItem[0],
              'imageLocation': classItem[1]
            };
          }
        }
      }
    }

    if (settings['armor']) {
      for (List<String> armor in renderArmor) {
        if (data.containsKey(armor[0])) {
          displayItems
              .add(_addItem(armor, data[armor[0]], settings['secondaryColor']));

          if (data[armor[0]]['buyLink'] != null) {
            allOffers[int.parse(data[armor[0]]['buyLink']
                .replaceAll('/offers-to/buy/', ''))] = {
              'name': armor[0],
              'imageLocation': armor[1]
            };
          } else if (data[armor[0]]['sellLink'] != null) {
            allOffers[int.parse(data[armor[0]]['sellLink']
                .replaceAll('/offers-to/sell/', ''))] = {
              'name': armor[0],
              'imageLocation': armor[1]
            };
          }
        }
      }
    }

    if (settings['rings']) {
      for (List<String> ring in renderRings) {
        if (data.containsKey(ring[0])) {
          displayItems
              .add(_addItem(ring, data[ring[0]], settings['secondaryColor']));

          if (data[ring[0]]['buyLink'] != null) {
            allOffers[int.parse(
                data[ring[0]]['buyLink'].replaceAll('/offers-to/buy/', ''))] = {
              'name': ring[0],
              'imageLocation': ring[1]
            };
          } else if (data[ring[0]]['sellLink'] != null) {
            allOffers[int.parse(data[ring[0]]['sellLink']
                .replaceAll('/offers-to/sell/', ''))] = {
              'name': ring[0],
              'imageLocation': ring[1]
            };
          }
        }
      }
    }

    if (settings['eggs']) {
      for (List<String> egg in renderEggs) {
        if (data.containsKey(egg[0])) {
          displayItems
              .add(_addItem(egg, data[egg[0]], settings['secondaryColor']));

          if (data[egg[0]]['buyLink'] != null) {
            allOffers[int.parse(
                data[egg[0]]['buyLink'].replaceAll('/offers-to/buy/', ''))] = {
              'name': egg[0],
              'imageLocation': egg[1]
            };
          } else if (data[egg[0]]['sellLink'] != null) {
            allOffers[int.parse(data[egg[0]]['sellLink']
                .replaceAll('/offers-to/sell/', ''))] = {
              'name': egg[0],
              'imageLocation': egg[1]
            };
          }
        }
      }
    }

    if (settings['st']) {
      for (List<String> theme in specialThemed) {
        if (data.containsKey(theme[0])) {
          displayItems.add(_addItem(theme, data[theme[0]], Colors.orange[700]));
          if (data[theme[0]]['buyLink'] != null) {
            allOffers[int.parse(data[theme[0]]['buyLink']
                .replaceAll('/offers-to/buy/', ''))] = {
              'name': theme[0],
              'imageLocation': theme[1]
            };
          } else if (data[theme[0]]['sellLink'] != null) {
            allOffers[int.parse(data[theme[0]]['sellLink']
                .replaceAll('/offers-to/sell/', ''))] = {
              'name': theme[0],
              'imageLocation': theme[1]
            };
          }
        }
      }
    }

    if (displayItems.length > 0) {
      return displayItems;
    } else {
      return [
        Center(
          child: Text(
            "Nothing avaiable to display!\nTry changing some filters?",
            style: TextStyle(color: settings['secondaryColor'], fontSize: 20),
          ),
        )
      ];
    }
  }

  Container _addItem(List databaseItem, Map passedOffer, Color borderColor) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: borderColor),
          color: settings['primaryColor'],
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
                color: settings['secondaryColor'],
                offset: Offset(3, 3),
                blurRadius: 2)
          ]), //? boxDeco is the decoration of the boxes.
      //? it's defined at the end of this dart code and is used on every display option.
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .center, // Alinha todos os itens dessa linha horizontalmente.
        mainAxisSize: MainAxisSize
            .min, // Encolhe a linha com o menor comprimento possível.
        crossAxisAlignment: CrossAxisAlignment
            .center, // Alinha todos os itens dessa linha verticalmente.
        children: [
          Tooltip(
            // Isso vai mostrar o nome do item quando você coloca o mouse em cima do ícone.
            message: databaseItem[0],
            child: Hero(
              tag: databaseItem[0],
              child: Image.asset(
                databaseItem[1],
                width: 40,
                height: 40,
              ),
            ),
          ),
          SizedBox(
            //Espaçamento entre a imagem e os botões.
            width: 3,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, //Centraliza os botões de compra e venda verticalmente.
            mainAxisSize:
                MainAxisSize.min, // Deixa a coluna no menor tamanho possível.
            crossAxisAlignment: CrossAxisAlignment
                .center, // Centraliza os botões de compra e venda horizontalmente.
            children: [
              _anySell(passedOffer['sellNumber'], databaseItem,
                  passedOffer['sellLink']),
              SizedBox(height: 5),
              _anyBuy(passedOffer['buyNumber'], databaseItem,
                  passedOffer['buyLink']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _anySell(dynamic sellers, List item, String sellLink) {
    if (sellers != null) {
      return MaterialButton(
          color: Colors.red[700], // Pinta os botões de venda na cor vermelho.
          minWidth:
              40, //Especifica a largura minima dos botões. Esse valor de 40 é suficiente para compreender números de 4 casas sem alteração no layout.
          height: 32,
          materialTapTargetSize: MaterialTapTargetSize
              .shrinkWrap, // Essa configuração remove a margem ao redor dos botões.
          padding: EdgeInsets.all(5),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return SpecificItem(item, sellLink);
            }));
          },
          child: Tooltip(
            message: "How many players currently want to sell this item",
            child: Text(
              sellers.toString(),
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ));
    } else {
      return MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize
              .shrinkWrap, // Essa configuração remove a margem ao redor dos botões.
          minWidth:
              40, //Especifica a largura minima dos botões. Esse valor de 40 é suficiente para compreender números de 4 casas sem alteração no layout.
          height: 32,
          padding: EdgeInsets.all(5),
          onPressed: () {},
          child: Tooltip(
            message: "No one is selling this item at the moment",
            child: Text(
              "0",
              style: TextStyle(color: settings['secondaryColor'], fontSize: 12),
            ),
          ));
    }
  }

  Widget _anyBuy(dynamic buyers, List item, String buyLink) {
    if (buyers != null) {
      return MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize
            .shrinkWrap, // Essa configuração remove a margem ao redor dos botões.
        color: Colors.blue[700], // Pinta os botões de compra na cor azul.
        minWidth:
            40, //Especifica a largura minima dos botões. Esse valor de 40 é suficiente para compreender números de 4 casas sem alteração no layout.
        height: 32,
        padding: EdgeInsets.all(5),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SpecificItem(item, buyLink);
          }));
        },
        child: Tooltip(
          message: "How many players currently want to buy this item",
          child: Text(
            buyers.toString(),
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    } else {
      return MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize
            .shrinkWrap, // Essa configuração remove a margem ao redor dos botões.
        minWidth:
            40, //Especifica a largura minima dos botões. Esse valor de 40 é suficiente para compreender números de 4 casas sem alteração no layout.
        height: 32,
        padding: EdgeInsets.all(5),
        onPressed: () {},
        child: Tooltip(
          message: "No one is buying this item at the moment",
          child: Text(
            "0",
            style: TextStyle(color: settings['secondaryColor'], fontSize: 12),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: renderItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return SingleChildScrollView(
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: snapshot.data,
                ),
              ),
            );
          } else {
            return Container(
              color: settings['primaryColor'],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tooltip(
                      message:
                          "If this is taking too long, please press Refresh.",
                      child: CircularProgressIndicator(
                        backgroundColor: settings['secondaryColor'],
                        strokeWidth: 8,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Now fetching current offers...",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ]),
            );
          }
        });
  }
}
