import 'package:flutter/material.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/utils/Property.dart';

class carListPropertyPage extends StatelessWidget {

  final Property property;
  const carListPropertyPage({super.key, required this.property});

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
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Color(0xFF025CCB).withOpacity(1.0),
                          BlendMode.hardLight),
                      image: AssetImage(
                        property.image[0],
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
                            child: Text(property.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Poppins')),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(property.year,
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
                    property.image[0],
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
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('CATEGORIE : '+property.cat.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('CARBURANT : '+property.carb.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('BOITE : '+property.boit.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('KILOMETRAGE : '+property.Km.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('COULEUR : '+property.col.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('INTERIEUR : '+property.intr.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('CYLINDREE : '+property.cyl.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('NB DE CYLINDRES : '+property.nb.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PUISSANCE DIN : '+property.puid.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PUISSANCE FISCALE : '+property.puif.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PLACES : '+property.plc.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PORTES : '+property.por.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                 ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
                  height: 50,
                  // width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF025CCB), width: 1.0)),
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
          bottomNavigationBar: bottomNavigationBar(),
        ));
    ;
  }
}
