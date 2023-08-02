import 'package:flutter/material.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/carsListPage.dart';
import 'package:app/pages/editProfilPage.dart';


class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
int _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(190),
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
              padding: EdgeInsets.only(left: 15, right:15),
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
                    margin: EdgeInsets.only(top: 100),
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
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 70,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            ),
                            child: Center(
                              child: Icon(Icons.filter_alt_outlined),
                            ),
                        ),
                      ])
                ],
              )),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top:15),
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
                                  fontWeight: FontWeight.w500))
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child:GestureDetector(
                    onTap: () {
                      
                    },
                    child:  Row(
                    children: [
                       Text("Plus ",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          weight: 30,
                          color: Colors.black
                        ),
                    ])
                  ),
                )
              ],
            )
          ],
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
                              builder: (context) => editProfilPage(),
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
