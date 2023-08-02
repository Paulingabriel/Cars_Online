import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/widgets/Carte.dart';
import 'package:app/utils/Property.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/carsListPage.dart';
import 'package:app/pages/editProfilPage.dart';

class carsList extends StatefulWidget {
  const carsList({super.key});

  @override
  State<carsList> createState() => _carsList();
}


class _carsList extends State<carsList> {
  int _currentTab = 1;

  final List<Property> properties = [
    Property(
      '1',
      'coupé',
      'Essence',
      'manuellle de 6 vitesses',
      '2019',
      '54000 kms',
      'jaune',
      'cuir noir',
      '5000 cm3',
      '8',
      '450 hp/450 ch',
      '36 cv fiscaux',
      '4 places',
      '2 portes',
      'images/car7.jpg',
      'Mercedes GL 450',
      'Annee 2019',
      'La Mercedes GLA 450 AMG 4MATIC 2016 est un veritable bolide de rallye déguisé pour la route.Je n\'exagère pas:ce super petit utilitaire est alimenté par le moteur à 4 cylindres de serie le plus puissant au monde.exception faite des hybrides.',
      'Munich',
      'Allemagne',
      '4000,000£',
      'Automatique',
    ),
    Property(
      '2',
      'coupé',
      'Essence',
      'manuellle de 6 vitesses',
      '2017',
      '54000 kms',
      'jaune',
      'cuir noir',
      '5000 cm3',
      '8',
      '450 hp/450 ch',
      '36 cv fiscaux',
      '4 places',
      '2 portes',
      'images/car3.jpg',
      'Toyota Tundra',
      'Annee 2017',
      'La Toyota Tundra 4MATIC 2016 est un veritable bolide de rallye déguisé pour la route.Je n\'exagère pas:ce super petit utilitaire est alimenté par le moteur à 4 cylindres de serie le plus puissant au monde.exception faite des hybrides.',
      'Munich',
      'Allemagne',
      '4200,000£',
      'Automatique',
    ),
    Property(
      '3',
      'coupé',
      'Essence',
      'manuellle de 6 vitesses',
      '2019',
      '54000 kms',
      'jaune',
      'cuir noir',
      '5000 cm3',
      '8',
      '450 hp/450 ch',
      '36 cv fiscaux',
      '4 places',
      '2 portes',
      'images/car2.jpg',
      'Mercedes GL 450',
      'Annee 2019',
      'La Mercedes GLA 450 AMG 4MATIC 2016 est un veritable bolide de rallye déguisé pour la route.Je n\'exagère pas:ce super petit utilitaire est alimenté par le moteur à 4 cylindres de serie le plus puissant au monde.exception faite des hybrides.',
      'Munich',
      'Allemagne',
      '4000,000£',
      'Automatique',
    ),
    Property(
      '4',
      'coupé',
      'Essence',
      'manuellle de 6 vitesses',
      '2019',
      '54000 kms',
      'jaune',
      'cuir noir',
      '5000 cm3',
      '8',
      '450 hp/450 ch',
      '36 cv fiscaux',
      '4 places',
      '2 portes',
      'images/car4.jpg',
      'Mercedes MI 450',
      'Annee 2019',
      'La Mercedes MI 450 AMG 4MATIC 2016 est un veritable bolide de rallye déguisé pour la route.Je n\'exagère pas:ce super petit utilitaire est alimenté par le moteur à 4 cylindres de serie le plus puissant au monde.exception faite des hybrides.',
      'Berlin',
      'Allemagne',
      '4000,000£',
      'Automatique',
    ),
    Property(
      '5',
      'coupé',
      'Essence',
      'manuellle de 6 vitesses',
      '2019',
      '54000 kms',
      'jaune',
      'cuir noir',
      '5000 cm3',
      '8',
      '450 hp/450 ch',
      '36 cv fiscaux',
      '4 places',
      '2 portes',
      'images/car6.png',
      'Mercedes GL 450',
      'Annee 2019',
      'La Mercedes GLA 450 AMG 4MATIC 2016 est un veritable bolide de rallye déguisé pour la route.Je n\'exagère pas:ce super petit utilitaire est alimenté par le moteur à 4 cylindres de serie le plus puissant au monde.exception faite des hybrides.',
      'Munich',
      'Allemagne',
      '4000,000£',
      'Automatique',
    ),
    Property(
      '6',
      'coupé',
      'Essence',
      'manuellle de 6 vitesses',
      '2019',
      '54000 kms',
      'jaune',
      'cuir noir',
      '5000 cm3',
      '8',
      '450 hp/450 ch',
      '36 cv fiscaux',
      '4 places',
      '2 portes',
      'images/car8.jpg',
      'Mercedes GL 450',
      'Annee 2019',
      'La Mercedes GLA 450 AMG 4MATIC 2016 est un veritable bolide de rallye déguisé pour la route.Je n\'exagère pas:ce super petit utilitaire est alimenté par le moteur à 4 cylindres de serie le plus puissant au monde.exception faite des hybrides.',
      'Munich',
      'Allemagne',
      '4000,000£',
      'Automatique',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 237, 238),
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Filtre de véhicules',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 280,
                      child: Card(
                        elevation: 3,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      child: Card(
                        elevation: 3,
                        child: Center(
                          child: Icon(Icons.filter_alt_outlined),
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 8, right: 8),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    return Carte(property: properties[index]);
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFF025CCB),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Main(),
                            ));
                        setState(() {
                          _currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.home,
                              color: _currentTab == 0
                                  ? Colors.white
                                  : const Color.fromARGB(255, 129, 181, 223)),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => carsList(),
                            ));
                        setState(() {
                          _currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.directions_car,
                              color: _currentTab == 1
                                  ? Colors.white
                                  : const Color.fromARGB(255, 129, 181, 223))
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editProfilPage(),
                            ));

                        setState(() {
                          _currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person,
                              color: _currentTab == 2
                                  ? Colors.white
                                  : const Color.fromARGB(255, 129, 181, 223)),
                        ],
                      ),
                    ),
                  ],
                )
              ]),
        )),
    );
  }
}
