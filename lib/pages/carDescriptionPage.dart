import 'package:app/pages/carListPropertyPage.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/carProperty.dart';
import 'package:app/pages/carListPropertyPage.dart';
import 'package:app/pages/carDescriptionPage.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/utils/Property.dart';
import 'package:get/get.dart';

// class MyTabs extends GetxController with GetSingleTickerProviderStateMixin {
//   late TabController controller;

//   final List<Tab> myTabs = <Tab>[
//     Tab(text: 'Description'),
//     Tab(
//       text: 'Caractéristiques',
//     ),
//   ];

//   @override
//   void onInit() {
//     // TODO:implement onInit

//     controller = TabController(length: 2, vsync: this);
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     // TODO:implement onClose
//     controller.dispose();
//     super.onClose();
//   }
// }

class carDescriptionPage extends StatefulWidget {
  final Property property;
  const carDescriptionPage({super.key, required this.property});

  @override
  State<carDescriptionPage> createState() => _carDescriptionPage();
}

class _carDescriptionPage extends State<carDescriptionPage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final MyTabs _tabs = Get.put(MyTabs());
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
                        widget.property.image,
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
                            child: Text(widget.property.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Poppins')),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(widget.property.year,
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
                    controller: _controller,
                    // controller: _tabs.controller,
                    // tabs: _tabs.myTabs,
                    tabs: [
                      Tab(text: 'Description'),
                      Tab(
                        text: 'Caractéristiques',
                      ),
                    ]),
                // backgroundColor: Colors.red,
                // elevation: 10,
                // titleSpacing: 0,
              ),
              preferredSize: Size.fromHeight(150)),
          backgroundColor: Colors.white,
          body: TabBarView(
            controller: _controller,
            children: [
            SingleChildScrollView(
            child: Column(
              // controller: _tabs.controller,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: 12, right: 12, top: 15, bottom: 15),
                    child: Hero(
                      tag: "Modèle " + widget.property.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.property.image,
                          height: 180,
                          width: 400,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 15),
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
                  decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 211, 217, 224).withOpacity(1.0),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(widget.property.description,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                    margin: EdgeInsets.only(left: 16, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            carProperty(
                                icon: Icons.location_on,
                                text: widget.property.town + ',' + widget.property.country,
                                price: ''),
                            SizedBox(
                              height: 20,
                            ),
                            carProperty(
                                icon: Icons.monetization_on_outlined,
                                text: 'Prix:',
                                price: widget.property.price),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            carProperty(
                                icon: Icons.directions_car,
                                text: widget.property.type,
                                price: ''),
                            SizedBox(
                              height: 20,
                            ),
                            carProperty(
                                icon: Icons.local_gas_station_sharp,
                                text: widget.property.carb,
                                price: ''),
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 32,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
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

          SingleChildScrollView(
            child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.property.image,
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
                          title: Text('CATEGORIE : '+widget.property.cat.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('CARBURANT : '+widget.property.carb.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('BOITE : '+widget.property.boit.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('KILOMETRAGE : '+widget.property.Km.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('COULEUR : '+widget.property.col.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('INTERIEUR : '+widget.property.intr.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('CYLINDREE : '+widget.property.cyl.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('NB DE CYLINDRES : '+widget.property.nb.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PUISSANCE DIN : '+widget.property.puid.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PUISSANCE FISCALE : '+widget.property.puif.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PLACES : '+widget.property.plc.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child:  ListTile(
                          leading: Icon(Icons.directions_car, color: Colors.black),
                          title: Text('PORTES : '+widget.property.por.toUpperCase(), style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
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
          ]),
          

          bottomNavigationBar: bottomNavigationBar(),
        ));
  }
}
