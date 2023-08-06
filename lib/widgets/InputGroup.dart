import 'package:flutter/material.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/Input.dart';


class Group extends StatelessWidget {
  String label;
  Group({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          height: 20,
        ),
        formLabel(text: label, size: 12),
        SizedBox(
          height: 15,
        ),
        Input(),
      ]),
    );
  }
}
