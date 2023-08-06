import 'package:flutter/material.dart';
import 'package:app/models/carsModels.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/pages/carDescriptionPage.dart';
import 'package:app/Modal/ModalFilter.dart';

class carsFilter extends StatefulWidget {
  const carsFilter({super.key});

  @override
  State<carsFilter> createState() => _carsFilterState();
}

class _carsFilterState extends State<carsFilter> {
  PageController pageController = PageController(viewportFraction: 0.45);

  void _openModalFilter(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: ctx,
        
        builder: (_) {
          return FractionallySizedBox(
            heightFactor: 0.63,
            child: ModalFilter(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Color(0xFF025CCB).withOpacity(1.0), BlendMode.hardLight),
                  image: AssetImage(
                    'images/car7.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 60, bottom: 5),
                        child: Text('Liste des véhicules',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Poppins')),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            height: 40,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(17.5)),
                          )
                        ],
                      )
                    ])),
          ),
          preferredSize: Size.fromHeight(135)),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                return _openModalFilter(context);
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Filtrez",
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color(0xFF025CCB),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600)),
                    Icon(
                      Icons.filter_alt_outlined,
                      color: const Color(0xFF025CCB),
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: datasList.length,
                itemBuilder: (context, index) {
                  return CarView(context, index);
                }),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}

Widget CarView(context, int index) {
  return carCard(context, datasList[index]);
}

Widget carCard(context, CarModel datas) {
  return Row(
    children: [
      Expanded(
          child: Container(
        height: 210,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            // border: Border.all(width: 1.0),
            ),
        child: Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        carDescriptionPage(property: datas.car1),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.ease, parent: animation);
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ));
            },
            child: Container(
              width: 160,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                // border: Border.all(width: 1.0),
              ),
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      // border: Border.all(width: 2.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            datas.car1.image[0],
                          )),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 7.5, right: 7.5, top: 10),
                      height: 80,
                      width: 145,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 1.0),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(datas.car1.name,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                          Text(datas.car1.year,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car1.carb,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car1.price,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF025CCB),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.black,
                            size: 15,
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        carDescriptionPage(property: datas.car2),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      animation = CurvedAnimation(
                          curve: Curves.ease, parent: animation);
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ));
            },
            child: Container(
              width: 160,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                // border: Border.all(width: 1.0),
              ),
              child: Column(
                children: [
                  Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      // border: Border.all(width: 2.0),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            datas.car2.image[0],
                          )),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 7.5, right: 7.5, top: 10),
                      height: 80,
                      width: 145,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 1.0),
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(datas.car2.name,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                          Text(datas.car2.year,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car2.carb,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(datas.car2.price,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF025CCB),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.black,
                            size: 15,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.black,
                            size: 15,
                          ),
                        ]),
                  )
                ],
              ),
            ),
          )
        ]),
      )),
    ],
  );
}
