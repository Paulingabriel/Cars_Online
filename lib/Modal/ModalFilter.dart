import 'package:flutter/material.dart';

class ModalFilter extends StatefulWidget {
  const ModalFilter({super.key});

  @override
  State<ModalFilter> createState() => _ModalFilterState();
}

class _ModalFilterState extends State<ModalFilter> {
  double _currentSliderValue = 0;
  String? value;
  String? option;
  final listCar = ['Voiture de sport', 'Bus', 'picknick'];

  final listCountry = ['Allemangne', 'Cameroun', 'Espagne'];
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -100.0),
      child:  Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: Row(children: [
            Expanded(
              child: Text("Filtrez",
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF025CCB),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600)),
            ),
            Text("Reset",
                style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xFF025CCB),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600)),
          ]),
        ),
        SizedBox(
          height: 25,
        ),
        Text("Type de voiture",
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500)),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton<String>(
                  value: value,
                  isExpanded: true,
                  iconEnabledColor: Colors.black,
                  iconSize: 25,
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  padding: EdgeInsets.symmetric(vertical: 0),
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
        Text("Pays",
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500)),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton<String>(
                  value: option,
                  isExpanded: true,
                  iconEnabledColor: Colors.black,
                  iconSize: 25,
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  padding: EdgeInsets.symmetric(vertical: 0),
                  items: listCountry.map(MenuItem).toList(),
                  onChanged: (option) {
                    setState(() {
                      this.option = option;
                    });
                  }),
            )),
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
            max: 1000000,
            divisions: 10000,
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
            Text("1000000€",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600)),
          ]),
        ),
        SizedBox(
          height: 25,
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
          height: 25,
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
                onPressed: () {},
                minWidth: double.infinity,
                child: Text('Appliquer',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500)),
              ),
            )
          ],
        )
      ]),
    )
      );
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

  DropdownMenuItem<String> MenuItem(String option) {
    return DropdownMenuItem(
        value: option,
        child: Text(
          option,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ));
  }
}
