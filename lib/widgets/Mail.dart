import 'package:app/pages/carDescriptionPage.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/Property.dart';

import '../models/user.dart';

class Mail extends StatelessWidget {
  final Property property;
  final User user;
  const Mail({super.key, required this.property, required this.user});

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
                    tag: "Modèle " + property.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        property.image[0],
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
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('Nouveau post : ' + property.name,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: Colors.black)),
                                  Text(
                                      'Année:' +
                                          property.year +
                                          '/' +
                                          property.carb,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Poppins',
                                          color: Colors.black)),
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
                                SizedBox(
                                  width: 28,
                                  height: 16,
                                ),
                                Container(
                                  child: Row(children: [
                                    Text('il y a 1 heure',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF025CCB))),
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
