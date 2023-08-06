import 'package:flutter/material.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/Select.dart';

class Double extends StatelessWidget {
  String label1;
  String label2;
  Double({super.key, required this.label1, required this.label2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 150,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              formLabel(text: label1, size: 12),
              SizedBox(
                height: 15,
              ),
              Select()
            ]),
          ),
          Container(
            width: 150,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              formLabel(text: label2, size: 12),
              SizedBox(
                height: 15,
              ),
              Select()
            ]),
          )
        ],
      ),
    );
  }
}
