import 'package:flutter/material.dart';
import 'package:app/widgets/formLabel.dart';

class TextArea extends StatelessWidget {
  const TextArea({super.key});

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
        formLabel(text: 'Description', size: 12),
        SizedBox(
          height: 15,
        ),
       Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(1, 1)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        minLines: 8,
        maxLines: 8,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ))),
      ),
    )
      ]),
    );
  }
}