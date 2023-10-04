import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
<<<<<<< HEAD

import '../models/user.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
 

=======

import '../models/user.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF025CCB), Color(0xFF022C94)],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                height: 70,
                decoration: BoxDecoration(
                    // border: Border.all(width: 2.0, color: Colors.red),
                    ),
                child: Center(
                  child: Text(
                    'BIENVENUE SUR',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Container(
                  height: 80,
                  decoration: BoxDecoration(
                      // border: Border.all(width: 2.0, color: Colors.red),
                      ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          //  border: Border.all(width: 2.0, color: Colors.black),
                          ),
                      child: Image.asset(
                        'images/logoblanc.png',
                        width: 250,
                      ),
                    ),
                  )),
              Container(
                height: 350,
                decoration: BoxDecoration(
                    // border: Border.all(width: 2.0, color: Colors.red),
                    ),
                child: Center(
                    child: Indexer(
                  children: [
                    Indexed(
                      index: 3,
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 75,
                        ),
                        decoration: BoxDecoration(
                            //  border: Border.all(width: 2.0, color: Colors.black),
                            ),
                        child: Image.asset(
                          'images/car6.png',
                          width: 350,
                        ),
                      ),
                    ),
                    Indexed(
                      index: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 25,
                        ),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 113, 151, 182),
                            // border: Border.all(width: 2.0, color: Colors.red),
                            shape: BoxShape.circle),
                        height: 300,
                        width: 300,
                      ),
                    ),
                  ],
                )),
              ),
              Container(
                  height: 50,
                  // padding: EdgeInsets.all(15),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                      // border: Border.all(width: 2.0, color: Colors.white),
                      ),
                  child: Center(
                    child: Text(
                        'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quis, facilis consectetur. Illo, incidunt',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 141, 203, 253),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: 'Poppins')),
                  )),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    // border: Border.all(width: 2.0, color: Colors.white,),
                    ),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: BorderSide(
                              color: Color.fromARGB(255, 141, 203, 253)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Main(user: User()),
                              ));
                        },
                        icon: Text('Continuer',
                            style: TextStyle(
                                color: Color.fromARGB(255, 141, 203, 253),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2.0,
                                fontFamily: 'Poppins')),
                        label: Icon(Icons.arrow_forward, color: Colors.white)),
                  ),
                ),
              ),
            ],
          )),
        ));
  }
}
