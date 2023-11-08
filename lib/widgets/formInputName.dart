import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class formInputName extends StatefulWidget {

  final IconData? icon;
  TextEditingController txtName;

  formInputName({super.key, this.icon, required this.txtName});
  @override
  State<formInputName> createState() => _formInputNameState();
}

class _formInputNameState extends State<formInputName> {
  @override
  Widget build(BuildContext context) {
    return Indexer(
      children: [
      Indexed(
      index: 1,
      child: Container(
      height: 47.5,
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
    ),
        ),
        Indexed(
        index: 3,
        child:  TextFormField(
        controller: widget.txtName,
        keyboardType: TextInputType.name,
        validator: (val) {
              if (val!.isEmpty) {
                return 'Le champ nom est requis.';
              }
              else if (val!.length < 3 && val.isNotEmpty) {
                return 'Au moins 3 charactères requis.';
              } else {
                return null;
              }
            },
        // validator: (val) => val!.isEmpty
        //     ? 'champ requis.'
        //     : null,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            suffixIcon: Icon(widget.icon, color: Colors.black),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )
                )),
      ),
        ),
      ],
    );
  }
}
