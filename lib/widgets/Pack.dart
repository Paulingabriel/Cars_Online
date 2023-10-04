import 'package:flutter/material.dart';

class Pack extends StatelessWidget {
  final Color? bg;
  final Color? color1;
  final Color? color2;
  final Color? color3;
  final Color? color4;
  final Color? color5;
  final Color? color6;
  const Pack({super.key, required this.bg, required this.color1, required this.color2, required this.color3, required this.color4, required this.color5, required this.color6});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 20, top: 10, bottom: 12),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(10),
        color: bg,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0,
              offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black, width: 1.0)
                ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            'PACK GRATUIT',
                            style: TextStyle(
                              fontSize: 14,
                              // fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              color: color1,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //     color: Colors.blue, width: 1.0
                              //     )
                              ),
                          height: 100,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.check_circle_outline_rounded),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Lorem ipsum',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: color2,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check_circle_outline_rounded),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Lorem ipsum',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: color2,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.check_circle_outline_rounded),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Lorem ipsum',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: color2,
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: color3, shape: BoxShape.circle),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text('0£',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: color4,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text('/mois',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: color4,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 40,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF025CCB), Color(0xFF022C94)],
                ),
              ),
              child: MaterialButton(
                onPressed: () {},
                child: Text("Souscrire",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 203, 219, 232),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
