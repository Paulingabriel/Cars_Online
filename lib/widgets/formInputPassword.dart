import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

<<<<<<< HEAD
=======

>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
class formInputPassword extends StatefulWidget {
  final IconData icon;
  TextEditingController txtPassword;

<<<<<<< HEAD
  formInputPassword({super.key, required this.icon, required this.txtPassword});
=======
  formInputPassword(
      {super.key,
      required this.icon,
      required this.txtPassword});
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88

  @override
  State<formInputPassword> createState() => _formInputPasswordState();
}

<<<<<<< HEAD
class _formInputPasswordState extends State<formInputPassword> {
=======

class _formInputPasswordState extends State<formInputPassword> {


>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
  @override
  Widget build(BuildContext context) {
    return Indexer(
      children: [
        Indexed(
<<<<<<< HEAD
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
=======
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
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
        Indexed(
          index: 3,
          child: TextFormField(
            controller: widget.txtPassword,
            obscureText: true,
<<<<<<< HEAD
            validator: (val) {
              if (val!.length < 6) {
                return 'Au moins 6 charactères';
              } else if (val.isEmpty) {
                return 'Mot de passe requis.';
              } else {
                return null;
              }
            },
            // validator: (val) => val!.length < 6
            //     ? 'Au moins 6 charactères'
            //     : null,
=======
            validator: (val) => val!.length < 6
                ? 'Au moins 6 charactères'
                : null,
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
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
