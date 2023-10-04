import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class bgBlue extends StatelessWidget {
  const bgBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return Indexed(
      index: 100,
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF025CCB), Color(0xFF022C94)],
          ),
        ),
      ),
    );
  }
}
