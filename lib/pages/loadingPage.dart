import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/pages/homePage.dart';

import '../models/user.dart';

class loadingPage extends StatefulWidget {

  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPage();
}

class _loadingPage extends State<loadingPage> {
  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() async {
    await Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => homePage()),
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/logo.png',
                      width: 300,
                    ),
                    SizedBox(height: 30),
                    SpinKitThreeBounce(
                      size: 20,
                      color: Color(0xFF025CCB),
                      duration: Duration(milliseconds: 1400),
                    )
                  ],
                ))));
  }
}
