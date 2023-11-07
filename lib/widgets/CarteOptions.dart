import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/DashboardCars.dart';
import 'package:app/pages/carDescriptionPage.dart';
import 'package:app/pages/carsForm.dart';
import 'package:app/pages/carsUpdate.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/utils/ListCars.dart';
import 'package:flutter/material.dart';
// import 'package:app/utils/Property.dart';

import '../models/user.dart';

class CarteOptions extends StatefulWidget {
  final User user;
  final ListCars property;
  const CarteOptions({super.key, required this.property, required this.user});

  @override
  State<CarteOptions> createState() => _CarteOptionsState();
}

class _CarteOptionsState extends State<CarteOptions> {
  void _deleteCar(int carId) async {
    ApiResponse response = await deleteCar(widget.property.carId as int);
    print(response);

    if (response.error == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Cars(user: widget.user)),
          (route) => false);
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => loginPage()),
                (route) => false)
          });
    } else {
      setState(() {
        var loading = false;
      });
      print(response);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  carDescriptionPage(
                      property: widget.property, user: widget.user),
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
                    tag: "Modèle " + widget.property.carId.toString(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        widget.property.images![0]
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
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.property.nom!,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Poppins',
                                          color: Colors.black)),
                                  SizedBox(height: 5),
                                  Text(widget.property.prix.toString(),
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
                            padding: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.blue, width: 1.0)
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      // border: Border.all()
                                      ),
                                  child: Row(children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  carDescriptionPage(
                                                      property: widget.property,
                                                      user: widget.user),
                                            ));
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                        color: Colors.blue,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => carsUpdate(
                                                  property: widget.property,
                                                  user: widget.user),
                                            ));
                                      },
                                      child: Icon(
                                        Icons.edit_square,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _deleteCar(
                                              widget.property.carId as int);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        )),
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
