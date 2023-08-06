import 'package:flutter/material.dart';

class formLabel extends StatelessWidget {

  final String text;
  double size;
  formLabel({super.key,
            required this.size,
            required this.text,
            });

  @override
  Widget build(BuildContext context) {
    return Text(
              text,
              style: TextStyle(
                fontSize: size, 
                fontFamily: 'Poppins', 
                fontWeight: FontWeight.w500
                )
              );
  }
}