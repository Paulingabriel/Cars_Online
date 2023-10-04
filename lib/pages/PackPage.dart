import 'package:flutter/material.dart';
import 'package:app/widgets/bottomNavigationBar.dart';

import '../models/user.dart';

class PackPage extends StatelessWidget {
  final User user;
  const PackPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          flexibleSpace: Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(40)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 3, 20, 65),
                    const Color(0xFF025CCB)
                  ],
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    'Créer un compte Vendeur',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      color: Color.fromARGB(255, 191, 206, 218),
                    ),
                  ),
                ),
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 18, bottom: 0),
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 1.0)
                  ),
              child: Center(
                child: Text(
                  'Veuillez choisir votre PACK',
                  style: TextStyle(
                    fontSize: 14,
                    // fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black, width: 1.0)
                  ),
              padding: EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Column(children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 20, top: 10, bottom: 12),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black, width: 1.0)
                            ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: const Text(
                                        'PACK GRATUIT',
                                        style: TextStyle(
                                          fontSize: 14,
                                          // fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF025CCB),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     color: Colors.blue, width: 1.0
                                          //     )
                                          ),
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .check_circle_outline_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .check_circle_outline_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .check_circle_outline_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                height: 140,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF025CCB),
                                          shape: BoxShape.circle),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text('0€',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 7),
                                            child: Text('',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF025CCB), Color(0xFF022C94)],
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text("Souscrire",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 203, 219, 232),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 20, top: 10, bottom: 12),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF025CCB),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black, width: 1.0)
                            ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: const Text(
                                        'PACK PREMIUM',
                                        style: TextStyle(
                                          fontSize: 14,
                                          // fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     color: Colors.blue, width: 1.0
                                          //     )
                                          ),
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .check_circle_outline_rounded,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                height: 140,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text('20€',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xFF025CCB),
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 7),
                                            child: Text('/mois',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xFF025CCB),
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text("Souscrire",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF025CCB),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 20, top: 10, bottom: 12),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black, width: 1.0)
                            ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: const Text(
                                        'PACK GOLD',
                                        style: TextStyle(
                                          fontSize: 14,
                                          // fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF025CCB),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //     color: Colors.blue, width: 1.0
                                          //     )
                                          ),
                                      height: 100,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .check_circle_outline_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .check_circle_outline_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons
                                                    .check_circle_outline_rounded),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Lorem ipsum',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                height: 140,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF025CCB),
                                          shape: BoxShape.circle),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text('50€',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 7),
                                            child: Text('/mois',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF025CCB), Color(0xFF022C94)],
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text("Souscrire",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 203, 219, 232),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(user: user),
    );
  }
}
