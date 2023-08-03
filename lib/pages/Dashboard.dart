import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:app/widgets/Sidebar.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/utils/Property.dart';
import 'package:app/widgets/Carte.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
      '4000,000€',
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
      '4200,000€',
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
      '4000,000€',
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
      '4000,000€',
      'Automatique',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(220),
          child: Indexer(children: [
            Indexed(
              index: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: Container(
                    width: 400,
                    height: 180,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(80),
                          bottomLeft: Radius.circular(80)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF022C94), const Color(0xFF025CCB)],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 54),
                            child: Container(
                              margin: EdgeInsets.only(left: 45),
                              child: Text(
                                'DASHBOARD',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
            ),
            Indexed(
                index: 2,
                child: Container(
                  margin: EdgeInsets.only(top: 90),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 170,
                          width: 325,
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 5)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: CircleAvatar(
                                    radius: 64,
                                    backgroundImage:
                                        AssetImage('images/profil.png'),
                                  )),
                              SizedBox(height: 15),
                              Text("Hello, Louis Meranda",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: const Color(0xFF025CCB),
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600)),
                              Text("+49 180 1 654321",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ]),
                )),
          ])),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 380,
                  width: 300,
                  padding: EdgeInsets.only(top: 15, bottom: 0),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      //                    <--- top side
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 155,
                              width: 147,
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              decoration: BoxDecoration(
                                  // border: Border.all(width: 1.0),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.directions_car,
                                            color: Colors.black,
                                            size: 25,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("04",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Nombre de véhicules",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                            Container(
                              height: 155,
                              width: 147,
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              decoration: BoxDecoration(
                                  // border: Border.all(width: 1.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xFF025CCB),
                                      Color(0xFF022C94)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.visibility,
                                            color: Color(0xFF025CCB),
                                            size: 25,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("100",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Nombre de vues",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 155,
                              width: 147,
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              decoration: BoxDecoration(
                                  // border: Border.all(width: 1.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xFF025CCB),
                                      Color(0xFF022C94)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.chrome_reader_mode_rounded,
                                            color: Color(0xFF025CCB),
                                            size: 25,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Gratuit",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Mon abonnement",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                            Container(
                              height: 155,
                              width: 147,
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              decoration: BoxDecoration(
                                  // border: Border.all(width: 1.0),
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.phone_in_talk,
                                            color: Colors.black,
                                            size: 25,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Assistance",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Vehicules tendances",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                    ],
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 8, right: 8),
            margin: EdgeInsets.only(bottom: 25),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: properties.length,
                itemBuilder: (context, index) {
                  return Carte(property: properties[index]);
                }),
          ),
        ],
      )),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
