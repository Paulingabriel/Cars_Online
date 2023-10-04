import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/Notifications.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/widgets/CarteOptions.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:app/models/carsModels.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/pages/carDescriptionPage.dart';
import 'package:app/Modal/ModalFilter.dart';
// import 'package:app/utils/Property.dart';
import 'package:app/widgets/Carte.dart';

import '../models/user.dart';

class Cars extends StatefulWidget {
  final User user;
  const Cars({super.key, required this.user});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  PageController pageController = PageController(viewportFraction: 0.45);

  List<dynamic?> _carsList = [];

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
      drawer: Navbar(user: widget.user),
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notifications(user: widget.user),
                      ));
                },
              )
            ],
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF022C94), const Color(0xFF025CCB)],
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 105,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            height: 45,
                            width: 310,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22.5)),
                          )
                        ],
                      )
                    ])),
          ),
          preferredSize: Size.fromHeight(135)),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Liste de vos véhicules',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                    // color: Colors.black
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  )),
                ),
              ),
            ]),
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _carsList.length,
                  itemBuilder: (context, index) {
                    return CarteOptions(
                        property: _carsList[index], user: widget.user);
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }
}
