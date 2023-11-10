import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class ModalFilter extends StatefulWidget {
  Function(String? type, String? pays, String? ville, double prix) sendValues;
  ModalFilter({required this.sendValues, super.key});

  @override
  State<ModalFilter> createState() => _ModalFilterState();
}

class _ModalFilterState extends State<ModalFilter> {
  String? _txtVille = '';
  String? _txtPays = '';
  double _currentSliderValue = 0;
  String? value;
  // String? option;
  final listCar = ['Essence', 'Gasoil', 'Kerozen'];

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0, -100),
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Row(children: [
                Expanded(
                  child: Text("Filtre",
                      style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xFF025CCB),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                ),
                Row(
                  children: [
                   Transform.translate(
                    offset: Offset(15, -20),
                    child:  Container(
                      height: 5,
                      child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close_outlined,
                      color: const Color(0xFF025CCB),
                    ))
                    )
                   )
                  ],
                )
                // Text("Reset",
                //     style: TextStyle(
                //         fontSize: 12,
                //         color: const Color(0xFF025CCB),
                //         fontFamily: 'Poppins',
                //         fontWeight: FontWeight.w600)),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Type de voiture",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.circular(3)),
                  child: DropdownButtonFormField<String>(
                      value: value,
                      isExpanded: true,
                      iconEnabledColor: Colors.black,
                      iconSize: 25,
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                      // padding: EdgeInsets.only(bottom: 10),
                      items: listCar.map(buildMenuItem).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.value = value;
                        });
                      }),
                )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CSCPicker(
                    onCountryChanged: (country) {
                      List<String> pays = country.split("    ");
                      print(pays.length);
                      print(pays[0]);
                      // print(pays[1]);
                      setState(() {
                        _txtPays = pays[1];
                      });
                    },
                    onStateChanged: (state) {
                      print(state);
                    },
                    onCityChanged: (city) {
                      setState(() {
                        _txtVille = city;
                      });
                      print(city);
                    },
                    countryDropdownLabel: "*Pays",
                    stateDropdownLabel: "*Etat",
                    cityDropdownLabel: "*Ville",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text("Prix",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500)),
            Slider(
                value: _currentSliderValue,
                max: 10000000,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                }),
            Container(
              child: Row(children: [
                Expanded(
                  child: Text("0€",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600)),
                ),
                Text("10000000€",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600)),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Note",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(children: [
                Icon(
                  Icons.star_border,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.black,
                  size: 25,
                ),
              ]),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF022C94), Color(0xFF025CCB)],
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      widget.sendValues(
                          value, _txtPays, _txtVille, _currentSliderValue);
                      Navigator.pop(context);
                    },
                    minWidth: double.infinity,
                    child: Text(
                      'Appliquer',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ));
  }

  // DropdownMenuItem<String> MenuItem(String option) {
  //   return DropdownMenuItem(
  //       value: option,
  //       child: Text(
  //         option,
  //         style: TextStyle(
  //             fontSize: 12,
  //             color: Colors.black,
  //             fontFamily: 'Poppins',
  //             fontWeight: FontWeight.w500),
  //       ));
  // }
}
