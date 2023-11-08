import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class formInputPasswordConfirm extends StatefulWidget {
  final IconData icon;
  TextEditingController txtPassword;
  TextEditingController txtPasswordConfirm;

  formInputPasswordConfirm(
      {super.key,
      required this.icon,
      required this.txtPassword,
      required this.txtPasswordConfirm});

  @override
  State<formInputPasswordConfirm> createState() =>
      _formInputPasswordConfirmState();
}

class _formInputPasswordConfirmState extends State<formInputPasswordConfirm> {
  var _isObscured = true;

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
            controller: widget.txtPasswordConfirm,
            obscureText: _isObscured,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Le champ mot de passe est requis.';
              } else if (val != widget.txtPassword.text) {
                return 'Mot de passe de Confirmation incorrecte.';
              } else {
                return null;
              }
            },
            // validator: (val) => val != widget.txtPassword.text
            //     ? 'Confirmation incorrecte.'
            //     : null,

            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                suffixIcon: IconButton(
                  icon: _isObscured
                      ? Icon(Icons.visibility_off, color: Colors.grey)
                      : Icon(Icons.visibility, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
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
