import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class formInputEmail extends StatefulWidget {
  final IconData icon;
  TextEditingController txtEmail;

  formInputEmail({super.key, required this.icon, required this.txtEmail});

  @override
  State<formInputEmail> createState() => _formInputEmailState();
}

class _formInputEmailState extends State<formInputEmail> {
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
      child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: widget.txtEmail,
<<<<<<< HEAD
             validator: (val) {
              if (val!.length < 3) {
                return 'Au moins 3 charactères requis.';
              } else if (val.isEmpty) {
                return 'Mot de passe requis.';
              } else {
                return null;
              }
            },
            // validator: (val) => (val!.isEmpty || !val.contains('@')) ? 'Adresse email invalide.' : null,
=======
            validator: (val) => (val!.isEmpty || !val.contains('@')) ? 'Adresse email invalide requis.' : null,
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
