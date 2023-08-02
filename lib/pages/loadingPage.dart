import 'package:flutter/material.dart';

class loadingPage extends StatelessWidget {
  const loadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            height: 100,
            // decoration: BoxDecoration(
            // border:Border.all(width: 2.0, color: Colors.black),
            // ),
            child: Column(
              children: [
                Image.asset(
                  'images/logo.png',
                  width: 300,
                )
              ],
            )
          )
        )
    );
  }
}