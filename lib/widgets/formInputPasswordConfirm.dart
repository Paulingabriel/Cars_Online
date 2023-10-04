import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class formInputPasswordConfirm extends StatefulWidget {
  final IconData icon;
  TextEditingController txtPassword;
  TextEditingController txtPasswordConfirm;

<<<<<<< HEAD
  formInputPasswordConfirm(
      {super.key,
      required this.icon,
      required this.txtPassword,
      required this.txtPasswordConfirm});

  @override
  State<formInputPasswordConfirm> createState() =>
      _formInputPasswordConfirmState();
=======
  formInputPasswordConfirm({super.key, required this.icon, required this.txtPassword, required this.txtPasswordConfirm});

  @override
  State<formInputPasswordConfirm> createState() => _formInputPasswordConfirmState();
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
}

class _formInputPasswordConfirmState extends State<formInputPasswordConfirm> {
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
            controller: widget.txtPasswordConfirm,
            obscureText: true,
<<<<<<< HEAD
            validator: (val) {
              if (val != widget.txtPassword.text) {
                return 'Confirmation incorrecte.';
              } else if (val!.isEmpty) {
                return 'Mot de passe requis.';
              } else {
                return null;
              }
            },
            // validator: (val) => val != widget.txtPassword.text
            //     ? 'Confirmation incorrecte.'
            //     : null,
=======
            validator: (val) => val != widget.txtPassword.text
                ? 'Inexacte.'
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
