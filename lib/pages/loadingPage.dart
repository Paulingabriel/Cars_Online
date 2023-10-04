import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:app/pages/homePage.dart';

import '../models/user.dart';

class loadingPage extends StatefulWidget {

<<<<<<< HEAD
  const loadingPage({super.key});
=======
  final User user;
  const loadingPage({super.key, required this.user});
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88

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
<<<<<<< HEAD
        MaterialPageRoute(builder: (context) => homePage()),
=======
        MaterialPageRoute(builder: (context) => const homePage()),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
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
