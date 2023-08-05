import 'package:flutter/material.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/carsListPage.dart';
import 'package:app/pages/editProfilPage.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/models/models.dart';
import 'package:app/models/carsModels.dart';
import 'package:indexed/indexed.dart';
import 'package:app/utils/Property.dart';
import 'package:app/pages/carDescriptionPage.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  PageController pageController = PageController(viewportFraction: 0.45);
  int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(260),
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
                    height: 220,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(40)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [const Color(0xFF025CCB), Color(0xFF022C94)],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 95),
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                'Choisissez votre voiture',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  color: Color.fromARGB(255, 191, 206, 218),
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
                  padding: EdgeInsets.only(left: 15, right: 15),
                  margin: EdgeInsets.only(top: 140),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(Icons.tornado),
                          ),
                        ),
                      ]),
                )),
            Indexed(
              index: 1,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(145.0, -20.0),
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(19, 255, 255, 255),
                          // border: Border.all(width: 2.0, color: Colors.red),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(95.0, 80.0),
                    child: Container(
                      height: 230,
                      width: 230,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(35, 255, 255, 255),
                          // border: Border.all(width: 2.0, color: Colors.red),
                          shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            ),
            Indexed(
                index: 3,
                child: Transform.translate(
                  offset: const Offset(0, 220.0),
                  child: Container(
                      height: 135,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    child: Text("Catégories populaires",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500))),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Row(children: [
                                      Text("Plus ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600)),
                                      Icon(Icons.arrow_forward_ios,
                                          size: 10,
                                          weight: 30,
                                          color: Colors.black),
                                    ])),
                              )
                            ],
                          ),
                          Container(
                              height: 100,
                              padding: EdgeInsets.only(top: 10, bottom: 15),
                              // decoration: BoxDecoration(border: Border.all(width: 1.0)),
                              child: PageView.builder(
                                controller: pageController,
                                itemCount: dataList.length,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, position) {
                                  return CarouselView(position);
                                },
                              )
                            ),
                        ],
                      )),
                ))
          ])),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          margin: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Container(
                height: 130,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                  ],
                  // border: Border.all(width: 2.0),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/banner.png',
                      )),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        child: Text("Voitures récentes",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500))),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: GestureDetector(
                        onTap: () {},
                        child: Row(children: [
                          Text("Plus ",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600)),
                          Icon(Icons.arrow_forward_ios,
                              size: 10, weight: 30, color: Colors.black),
                        ])),
                  )
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: datasList.length,
                  itemBuilder: (context, index) {
                    return CarView(context, index);
                  }),
            ],
          ),
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
                                builder: (context) => Dashboard(),
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

Widget CarouselView(int index) {
  return carouselCard(dataList[index]);
}

Widget carouselCard(DataModel data) {
  return Transform.translate(
    offset: Offset(-75, 0),
    child: Container(
      height: 80,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        // border: Border.all(width: 2.0),
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.hardLight),
            fit: BoxFit.cover,
            image: AssetImage(
              data.imageName,
            )),
      ),
      child: Center(
        child: Text(data.title,
            style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300)),
      ),
    ),
  );
}

Widget CarView(context, int index) {
  return carCard(context, datasList[index]);
}

Widget carCard(context, CarModel datas) {
  return Row(
    children: [
      Expanded(
          child: Container(
        height: 210,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            // border: Border.all(width: 1.0),
            ),
        child: Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        carDescriptionPage(property: datas.car1),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.ease, parent: animation);
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ));
            },
            child: Container(
              width: 160,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                // border: Border.all(width: 1.0),
              ),
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      // border: Border.all(width: 2.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            datas.car1.image[0],
                          )),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 7.5, right: 7.5, top: 10),
                      height: 80,
                      width: 145,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 1.0),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(datas.car1.name,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                          Text(datas.car1.year,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car1.carb,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car1.price,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF025CCB),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                            Icons.star_border_outlined,
                            color: Colors.black,
                            size: 15,
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        carDescriptionPage(property: datas.car2),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.ease, parent: animation);
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ));
            },
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                // border: Border.all(width: 1.0),
              ),
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      // border: Border.all(width: 2.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            datas.car2.image[0],
                          )),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 7.5, right: 7.5, top: 10),
                      height: 80,
                      width: 145,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 1.0),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(datas.car2.name,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                          Text(datas.car2.year,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car2.carb,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car2.price,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF025CCB),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                            Icons.star_border_outlined,
                            color: Colors.black,
                            size: 15,
                          ),
                        ]),
                  )
                ],
              ),
            ),
          )
        ]),
      )),
    ],
  );
}
