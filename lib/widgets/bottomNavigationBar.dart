import 'package:flutter/material.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/carsListPage.dart';

import '../models/user.dart';

class bottomNavigationBar extends StatefulWidget {

  final  User user;
  const bottomNavigationBar({super.key, required this.user});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {


  @override
  Widget build(BuildContext context) {
    int _currentTab = 3;

    return BottomAppBar(
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
                              builder: (context) => carsList(user: widget.user),
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
                              builder: (context) => Dashboard(user: widget.user),
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
        ));
  }
}
