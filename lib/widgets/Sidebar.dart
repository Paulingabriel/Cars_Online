import 'package:app/pages/DashboardCars.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/carsFilterPage.dart';
import 'package:app/pages/carsForm.dart';

import '../models/user.dart';

class Sidebar extends StatefulWidget {
  final User user;
  const Sidebar({super.key, required this.user});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF022C94), Color(0xFF025CCB)],
            ),
          ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 30),
                child: Text('CAR ONLINE',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Poppins')),
              ),
              Container(
                height: 0.4,
                color: Colors.white,
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: ListTile(
                  leading: Icon(Icons.directions_car, color: Colors.white),
                  title: Transform.translate(
                    offset: Offset(-25, 0),
                    child: Text('Liste de Véhicules',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Poppins')),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
<<<<<<< HEAD
                          builder: (context) => Cars(user: widget.user),
=======
                          builder: (context) => carsFilter(user: widget.user),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                        ));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: ListTile(
                  leading: Icon(Icons.directions_car, color: Colors.white),
                  title: Transform.translate(
                    offset: Offset(-25, 0),
                    child: Text('Ajouter un véhicule',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Poppins')),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => carsForm(user: widget.user),
                        ));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: ListTile(
                  leading: Icon(Icons.category, color: Colors.white),
                  title: Transform.translate(
                    offset: Offset(-25, 0),
                    child: Text('Liste des catégories',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Poppins')),
                  ),
                  onTap: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: ListTile(
                  leading: Icon(Icons.category, color: Colors.white),
                  title: Transform.translate(
                    offset: Offset(-25, 0),
                    child: Text('Ajouter une catégorie',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'Poppins')),
                  ),
                  onTap: () {},
                ),
              )
              // UserAccountsDrawerHeader(
              //   accountName: Text(
              //     'AMBANG RICKY',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600,
              //       color: const Color(0xFF025CCB),
              //       fontFamily: 'Poppins'
              //     )
              //   ),
              //   accountEmail: Text(
              //     'ambangricky@gmail.com',
              //     style: TextStyle(
              //       fontSize: 12,
              //       fontWeight: FontWeight.w500,
              //       color: Colors.black,
              //       fontFamily: 'Poppins'
              //     )
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
              //   ),
              //   )
            ],
          )),
    );
  }
}
