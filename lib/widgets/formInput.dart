import 'package:flutter/material.dart';

class formInput extends StatelessWidget {

  final IconData icon;

  const formInput({super.key,
                  required this.icon
                  });

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 45,
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
                      child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        suffixIcon: Icon(icon, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )
                        )
                      ),
                    ),
                    );
  }
}