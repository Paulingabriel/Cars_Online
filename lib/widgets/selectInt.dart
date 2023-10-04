import 'package:flutter/material.dart';

class SelectInt extends StatefulWidget {
  List<String> list;
  var option;
  SelectInt({super.key, required this.list, required this.option});

  @override
  State<SelectInt> createState() => _SelectInt();
}

class _SelectInt extends State<SelectInt> {
  int i = 0;
  // @override
  // void initState() {
  //   super.initState();

  //   widget.option = i;

  // }

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
      child: DropdownButton<int>(
          value: widget.option,
          isExpanded: true,
          iconEnabledColor: Colors.black,
          iconSize: 25,
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          padding: EdgeInsets.symmetric(vertical: 0),
          items: widget.list.asMap().entries.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
              this.widget.option = value;
              print(widget.option);
            });
          }),
    );
  }

  DropdownMenuItem<int> buildMenuItem(e) {
    return DropdownMenuItem(
        value: e.key + 1,
        child: Text(
          e.value,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ));
  }
}
