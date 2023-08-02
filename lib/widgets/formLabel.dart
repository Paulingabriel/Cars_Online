import 'package:flutter/material.dart';

class formLabel extends StatelessWidget {

  final String text;
  double size;
  formLabel({super.key,
            this.size = 12,
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