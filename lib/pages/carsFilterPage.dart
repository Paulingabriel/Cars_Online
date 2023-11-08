import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/utils/ListCars.dart';
import 'package:flutter/material.dart';
import 'package:app/models/carsModels.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/pages/carDescriptionPage.dart';
import 'package:app/Modal/ModalFilter.dart';

import '../models/user.dart';

class carsFilter extends StatefulWidget {

  final User user;
  const carsFilter({super.key, required this.user});

  @override
  State<carsFilter> createState() => _carsFilterState();
}

class _carsFilterState extends State<carsFilter> {
  PageController pageController = PageController(viewportFraction: 0.45);

  List<dynamic?> _carsList = [];

  bool _loading = false;

  int userId = 0;

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


  Future<void> retrieveCars() async {
    print('bonjour');
    userId = await getUserId();
    ApiResponse response = await getCars();
    print(response.error);

    if (response.error == null) {
      setState(() {
        _carsList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => loginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  @override
  void initState() {
    retrieveCars();
    super.initState();
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
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            width: 330,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(17.5)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                // labelText: 'Search',
                                contentPadding: EdgeInsets.only(top: 6, bottom: 4, left: 5),
                                suffixIcon: Icon(Icons.search, color: Color(0xFF025CCB).withOpacity(1.0)),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none
                            ),
                            )
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
             _loading
                ? Container(
                    height: 210,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                :
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _carsList.length,
                 gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                    // childAspectRatio: 1,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  ),
                itemBuilder: (context, index) {
                  return CarView(context, index, widget.user);
                }),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }

  Widget CarView(context, int index, User user) {
    return carCard(context, _carsList[index], user);
  }

  Widget carCard(context, ListCars data, User user) {
  return Container(
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
                        carDescriptionPage(property: data, user: user),
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
              // margin: EdgeInsets.only(right: 10),
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
                          image: NetworkImage(
                            data.images![0] .replaceAll('"', '').replaceAll('\\', ''),
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
                          Text(data.nom!,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700)),
                          Text("Année " + data.annee!,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(data.type!,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500)),
                          Text(data.prix.toString(),
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
        ]),
      );
}

}



