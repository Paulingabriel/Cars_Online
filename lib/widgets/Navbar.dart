import 'package:flutter/material.dart';
import 'package:app/pages/editProfilPage.dart';
import 'package:app/pages/editPassword.dart';
import 'package:app/pages/carsListPage.dart';
import 'package:app/pages/carsFilterPage.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/PackPage.dart';
import 'package:app/pages/loginPage.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
         gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF022C94),Color(0xFF025CCB)],
        ),
        ),
        child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 30),
            child: Text('Profile',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Poppins'
                      )
                  ),
          ),
          Row(
            children: [
              Expanded(
              child: Container(
              height: 100,
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color:Color(0xFF025CCB), width: 1.0),
                        ),
                      child: CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage('images/profil.png'),
                      )
                    ),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AMBANG RICKY',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF025CCB),
                              fontFamily: 'Poppins'
                            )
                          ),
                          Text(
                            'ambangricky@gmail.com',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            )
                          ), 
                        ],
                      ),
                    ),
                ],
              ),
            ),)
            ],
          ),
          SizedBox(height: 20),
          ListTile(
                    leading: Icon(Icons.home_sharp, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Accueil',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Dashboard(),
                      ));
                    },
          ),
          Container(
              height: 0.2,
              color: Colors.white,
          ),
          ListTile(
                    leading: Icon(Icons.edit_square, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Editer profil',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {

                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              editProfilPage(),
                      ));
                    },
          ),
          Container(
              height: 0.2,
              color: Colors.white,
          ),
          ListTile(
                    leading: Icon(Icons.lock, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Modifier le mot de passe',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              editPassword(),
                      ));
                    },
          ),
          Container(
              height: 0.2,
              color: Colors.white,
          ),
          ListTile(
                    leading: Icon(Icons.translate, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Langue',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {},
          ),
          Container(
              height: 0.2,
              color: Colors.white,
          ),
          ListTile(
                    leading: Icon(Icons.directions_car, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Liste de Véhicules',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              carsFilter(),
                      ));
                    },
          ),
          Container(
              height: 0.2,
              color: Colors.white,
          ),
          ListTile(
                    leading: Icon(Icons.share, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Partage l\'application',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {},
          ),
          Container(
              height: 0.2,
              color: Colors.white,
          ),
          ListTile(
                    leading: Icon(Icons.groups, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Créer un compte vendeur',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PackPage(),
                      ));
                    },
          ),
         Container(
              height: 0.2,
              color: Colors.white,
          ),
          ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Transform.translate(
                              offset: Offset(-25, 0),
                              child:  Text('Déconnexion',
                                      style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontFamily: 'Poppins'
                                            )
                                      ),
                                 ),
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              loginPage(),
                      ));
                    },
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
          
        ],)
      ),
    );
  }
}