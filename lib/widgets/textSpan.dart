import 'package:flutter/material.dart';

class textSpan extends StatelessWidget {

  final String text;
  final String span;

  const textSpan({super.key,
                required this.text,
                required this.span
                });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: RichText(
              text: TextSpan(
                  text: text,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  children: [
            TextSpan(
              text: span,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF025CCB)),
            ),
          ]))),
    );
  }
}
