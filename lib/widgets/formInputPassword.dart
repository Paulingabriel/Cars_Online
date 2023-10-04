import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';


class formInputPassword extends StatefulWidget {
  final IconData icon;
  TextEditingController txtPassword;

  formInputPassword(
      {super.key,
      required this.icon,
      required this.txtPassword});

  @override
  State<formInputPassword> createState() => _formInputPasswordState();
}


class _formInputPasswordState extends State<formInputPassword> {


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
        )),
        Indexed(
          index: 3,
          child: TextFormField(
            controller: widget.txtPassword,
            obscureText: true,
            validator: (val) => val!.length < 6
                ? 'Au moins 6 charactères'
                : null,
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
                    ))),
          ),
        )
      ],
    );
  }
}
