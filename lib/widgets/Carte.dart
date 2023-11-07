import 'package:app/pages/carDescriptionPage.dart';
import 'package:app/utils/ListCars.dart';
import 'package:flutter/material.dart';
// import 'package:app/utils/Property.dart';

import '../models/user.dart';

import '../models/user.dart';

class Carte extends StatelessWidget {
  final User user;
  final ListCars property;
  const Carte({super.key, required this.property, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  carDescriptionPage(property: property, user: user),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // var begin = Offset(0.0, 1.0);
                // var end = Offset.zero;
                // var curve = Curves.ease;
                // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                // return SlideTransition(
                //   position: animation.drive(tween),
                //   child: child,
                // );

                animation =
                    CurvedAnimation(curve: Curves.ease, parent: animation);
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ));
      },
      child: Card(
          elevation: 5,
          child: Row(
            children: [
              Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 14, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                      // border: Border.all(color: Colors.black, width: 1.0)
                      ),
                  child: Hero(
                    tag: "Modèle " + property.carId.toString(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        property.images![0]
                            .replaceAll('"', '')
                            .replaceAll('images:', '')
                            .replaceAll('\\', '')
                            .replaceAll('{', '')
                            .replaceAll('}', ''),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Expanded(
                  child: Container(
                      height: 84,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.black, width: 1.0)
                          ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.red, width: 1.0)
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(property.ville!,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: Colors.black)),
                                  Text(
                                      property.nom! +
                                          ' | ' +
                                          'Année ' +
                                          property.annee!,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: Colors.black)),
                                  Text(property.prix.toString(),
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF025CCB))),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 12, bottom: 4, right: 12),
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.blue, width: 1.0)
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width: 28,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFF025CCB),
                                    ),
                                    child: Center(
                                      child: new IconButton(
                                        padding: new EdgeInsets.all(0.0),
                                        color: Colors.white,
                                        icon: new Icon(Icons.chevron_right,
                                            size: 16.0),
                                        onPressed: () {},
                                      ),
                                    )),
                                Container(
                                  child: Row(children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))),
            ],
          )),
    );
  }
}
