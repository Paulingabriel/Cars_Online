import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/utils/ListCars.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:app/pages/carsListPage.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/Notifications.dart';
import 'package:app/models/models.dart';
import 'package:app/models/carsModels.dart';
import 'package:indexed/indexed.dart';
import 'package:app/pages/carDescriptionPage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/user_service.dart';

class Main extends StatefulWidget {
  final User user;
  const Main({super.key, required this.user});

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  PageController pageController = PageController(viewportFraction: 0.45);
  int _currentTab = 0;
  bool _loading = true;

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
        _loading = _loading ? !_loading : _loading;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(user: widget.user),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(260),
          child: Indexer(children: [
            Indexed(
              index: 1,
              child: AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Notifications(user: widget.user),
                          ));
                    },
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
                index: 4,
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
              index: 2,
              child: Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(145.0, 75.0),
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
                    offset: const Offset(95.0, 110.0),
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
                          _loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
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
                                  )),
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
                    ),
                  ),
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
              _loading
                  ? 
                  Container(
                    height: 210,
                      child: Center(
                        child:  CircularProgressIndicator(),
                      ),
                    )
                  : GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _carsList.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 1,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemBuilder: (context, index) {
                        return CarView(context, index, widget.user);
                      })
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
                                builder: (context) => Main(user: widget.user),
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
                                builder: (context) =>
                                    carsList(user: widget.user),
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
                                builder: (context) =>
                                    Dashboard(user: widget.user),
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

  Widget CarView(context, int index, User user) {
    return carCard(context, _carsList[index], user);
  }

  Widget carCard(context, ListCars data, User user) {
    return Container(
      height: 210,
      margin: EdgeInsets.only(bottom: 15),
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1.0),
      // ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    carDescriptionPage(property: data, user: user),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  animation =
                      CurvedAnimation(curve: Curves.ease, parent: animation);
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ));
        },
        child: Container(
          width: 160,
          // margin: EdgeInsets.only(right: 10),
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
                      image: NetworkImage(data.images![0]
                          .replaceAll('"', '')
                          .replaceAll('\\', ''))),
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
                      Text(data.nom!,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700)),
                      Text('Année ' + data.annee!,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      Text(data.type!,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500)),
                      Text(data.prix!.toString(),
                          style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF025CCB),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700)),
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
    );
  }
}
