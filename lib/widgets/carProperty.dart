import 'package:flutter/material.dart';

class carProperty extends StatelessWidget {
  final IconData icon;
  final String text;
  final String price;
  carProperty({super.key, required this.icon, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Icon(icon, color: Color(0xFF025CCB)),
          SizedBox(
            width: 5,
          ),
          Text(text,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500)),
          Text(price,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600))
        ],
      )
    ;
  }
}

