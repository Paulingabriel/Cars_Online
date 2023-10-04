import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  List<String> list;
  String? option;

  Select({super.key, required this.list, required this.option});

   @override
  State<Select> createState() => _Select();
}


class _Select extends State<Select> {

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
          value: widget.option,
          isExpanded: true,
          iconEnabledColor: Colors.black,
          iconSize: 25,
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          padding: EdgeInsets.symmetric(vertical: 0),
          items: widget.list.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
                    widget.option = value;
                  });
            // print(option);
            // print(this.widget.option);
          }),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String Option) {
    return DropdownMenuItem(
        value: Option,
        child: Text(
          Option,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ));
  }
}
