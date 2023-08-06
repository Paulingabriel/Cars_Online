import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String? value;
  final list = [''];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(1, 1)),
        ],
        borderRadius: BorderRadius.circular(30),
         ),
      child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          iconEnabledColor: Colors.black,
          iconSize: 25,
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          padding: EdgeInsets.symmetric(vertical: 0),
          items: list.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          }),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String option) {
    return DropdownMenuItem(
        value: option,
        child: Text(
          option,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ));
  }
}
