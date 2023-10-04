import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/utils/ListCars.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
// import 'package:app/utils/Property.dart';
import 'package:app/pages/Notifications.dart';

import '../models/user.dart';
<<<<<<< HEAD

class carListPropertyPage extends StatefulWidget {
  
  final User user;
  final ListCars property;
  carListPropertyPage({super.key, required this.property, required this.user});

  @override
  State<carListPropertyPage> createState() => _carListPropertyPageState();
}

class _carListPropertyPageState extends State<carListPropertyPage> {

  List<dynamic?> _carsList = [];

  int userId = 0;


  Future<void> retrieveCars() async {
    print('bonjour');
    userId = await getUserId();
    ApiResponse response = await getCars();
    print(response.error);

    if (response.error == null) {
      setState(() {
        _carsList = response.data as List<dynamic>;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => loginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  @override
  void initState() {
    retrieveCars();
    super.initState();
  }

=======

class carListPropertyPage extends StatelessWidget {
  final Property property;
  final User user;
  const carListPropertyPage({super.key, required this.property, required this.user});
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                // title: Text('AppBar'),
                // centerTitle: true,
                // leading: IconButton(
                //   icon: Icon(Icons.arrow_left),
                //   onPressed: () {},
                // ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
<<<<<<< HEAD
                            builder: (context) => Notifications(user: widget.user),
=======
                            builder: (context) => Notifications(user: user),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                          ));
                    },
                  ),
                ],
                flexibleSpace: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Color(0xFF025CCB).withOpacity(1.0),
                          BlendMode.hardLight),
                      image: AssetImage(
                        widget.property.images![0],
                      ),
                      fit: BoxFit.cover,
                    )),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 85,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30, bottom: 5),
                            child: Text(widget.property.nom!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Poppins')),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(widget.property.annee!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    fontFamily: 'Poppins')),
                          )
                        ])),
                bottom: TabBar(
                  labelStyle: TextStyle(fontFamily: 'Poppins'),
                  indicatorColor: Color(0xFF025CCB),
                  indicatorWeight: 5,
                  tabs: [
                    Tab(text: 'Description'),
                    Tab(text: 'Caractéristiques'),
                  ],
                ),
                // backgroundColor: Colors.red,
                // elevation: 10,
                // titleSpacing: 0,
              ),
              preferredSize: Size.fromHeight(150)),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
<<<<<<< HEAD
                      widget.property.images![0],
=======
                      property.image[0],
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                      height: 180,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text('CATEGORIE : ' + widget.property.category!.toUpperCase(),
=======
                        title: Text('CATEGORIE : ' + property.cat.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
                        title: Text(
<<<<<<< HEAD
                            'CARBURANT : ' + widget.property.type!.toUpperCase(),
=======
                            'CARBURANT : ' + property.carb.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text('BOITE : ' + widget.property.boite!.toUpperCase(),
=======
                        title: Text('BOITE : ' + property.boit.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text('ANNEE : ' + widget.property.annee!.toUpperCase(),
=======
                        title: Text(
                            'KILOMETRAGE : ' + property.Km.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text(
                            'KILOMETRAGE : ' + widget.property.km!.toString() + 'KMS',
=======
                        title: Text('COULEUR : ' + property.col.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text('COULEUR : ' + widget.property.couleur!.toUpperCase(),
=======
                        title: Text(
                            'INTERIEUR : ' + property.intr.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text(
                            'INTERIEUR : ' + widget.property.sellerie!.toUpperCase(),
=======
                        title: Text('CYLINDREE : ' + property.cyl.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text('CYLINDREE : ' + widget.property.cylindrees!.toString(),
=======
                        title: Text(
                            'NB DE CYLINDRES : ' + property.nb.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
                        title: Text(
<<<<<<< HEAD
                            'NB DE CYLINDRES : ' + widget.property.cyl!.toString(),
=======
                            'PUISSANCE DIN : ' + property.puid.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
                        title: Text(
<<<<<<< HEAD
                            'PUISSANCE DIN : ' + widget.property.pdin!.toString() + 'HP/456 CH*',
=======
                            'PUISSANCE FISCALE : ' +
                                property.puif.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text(
                            'PUISSANCE FISCALE : ' +
                                widget.property.pfisc!.toString() + 'CV FISCAUX',
=======
                        title: Text('PLACES : ' + property.plc.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
<<<<<<< HEAD
                        title: Text('PLACES : ' + widget.property.place!.toUpperCase() + 'PLACES',
=======
                        title: Text('PORTES : ' + property.por.toUpperCase(),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
<<<<<<< HEAD
                    Card(
                      elevation: 5,
                      child: ListTile(
                        leading:
                            Icon(Icons.directions_car, color: Colors.black),
                        title: Text('PORTES : ' + widget.property.portiere!.toUpperCase() + 'PORTES',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
=======
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 40, right: 40, top: 20, bottom: 20),
                    height: 50,
                    // width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border:
                            Border.all(color: Color(0xFF025CCB), width: 1.0)),
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_sharp,
                              color: Color(0xFF025CCB),
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text("Contactez le vendeur",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF025CCB),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600))
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
<<<<<<< HEAD
          bottomNavigationBar: bottomNavigationBar(user: widget.user),
=======
          bottomNavigationBar: bottomNavigationBar(user: user),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
        ));
  }
}
