import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/Carte.dart';
// import 'package:app/utils/Property.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/Dashboard.dart';

import '../models/user.dart';

class carsList extends StatefulWidget {
  final User user;
  const carsList({super.key, required this.user});

  @override
  State<carsList> createState() => _carsList();
}

class _carsList extends State<carsList> {
  int _currentTab = 1;

  bool _loading = false;

  List<dynamic?> _carList = [];

  int userId = 0;

  Future<void> retrieveCars() async {
    print('bonjour');
    userId = await getUserId();
    ApiResponse response = await getCars();
    print(response.error);

    if (response.error == null) {
      setState(() {
        _carList = response.data as List<dynamic>;
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
      backgroundColor: Color.fromARGB(255, 233, 237, 238),
      drawer: Navbar(user: widget.user),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'Filtre de véhicules',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 265,
                      child: Card(
                        elevation: 3,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 70,
                      child: Card(
                        elevation: 3,
                        child: Center(
                          child: Icon(Icons.filter_alt_outlined),
                        ),
                      ),
                    ),
                  ]),
            ),
            _loading
                ? 
                Container(
                    height: 210,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.only(top: 10, left: 8, right: 8),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _carList.length,
                        itemBuilder: (context, index) {
                          return Carte(
                              property: _carList[index], user: widget.user);
                        }),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF025CCB),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Main(user: widget.user),
                              ));
                          setState(() {
                            _currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home,
                                color: _currentTab == 0
                                    ? Colors.white
                                    : const Color.fromARGB(255, 129, 181, 223)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    carsList(user: widget.user),
                              ));
                          setState(() {
                            _currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.directions_car,
                                color: _currentTab == 1
                                    ? Colors.white
                                    : const Color.fromARGB(255, 129, 181, 223))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Dashboard(user: widget.user),
                              ));

                          setState(() {
                            _currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,
                                color: _currentTab == 2
                                    ? Colors.white
                                    : const Color.fromARGB(255, 129, 181, 223)),
                          ],
                        ),
                      ),
                    ],
                  )
                ]),
          )),
    );
  }
}
