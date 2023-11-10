import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/widgets/paginator.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/Carte.dart';
// import 'package:app/utils/Property.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:number_paginator/number_paginator.dart';

import '../models/user.dart';

class carsList extends StatefulWidget {
  final User? user;
  const carsList({super.key, required this.user});

  @override
  State<carsList> createState() => _carsList();
}

class _carsList extends State<carsList> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // bool _autovalidate = false;
  TextEditingController txtNom = TextEditingController();
  int _currentTab = 1;
  int _currentPage = 1;
  bool _loading = true;
  var _isNotSearch = true;
  var _total;

  List<dynamic?> _carList = [];

  int userId = 0;

  Future<void> retrieveCars(_currentPage) async {
    print(_currentPage);
    int page = _currentPage;
    print('bonjour');
    userId = await getUserId();
    ApiResponse response = await getCars(page);
    print(response.error);

    if (response.error == null) {
      setState(() {
        _carList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
        _total = response.totalPages;
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


  //search by keys words
  Future<void> _searchKeyWords(String val) async {
    print('bonjour');
    String nom = val;
    userId = await getUserId();
    ApiResponse response = await searchKey(nom);
    print(response.error);

    if (response.error == null) {
      setState(() {
        _carList = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
        _isNotSearch = _isNotSearch ? !_isNotSearch : _isNotSearch;
        _total = response.totalPages;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => loginPage()),
                (route) => false)
          });
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('${response.error}'),
      // ));
    }
  }

  @override
  void initState() {
    retrieveCars(1);
    super.initState();
  }

  void _loadUserInfo() async {
    String token = await getToken();
    if (token == '') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => loginPage()),
          (route) => false);
    } else {
      print(token);
      ApiResponse response = await getUserDetail();
      final user = response.data;
      print(response);
      if (response.error == null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => Dashboard(user: user as User)),
            (route) => false);
      } else if (response.error == unauthorized) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Main(user: user as User)),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
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
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 40,
                              width: 265,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 3.0,
                                      offset: Offset(0, 2.5)),
                                ],
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                // border: Border.all(width: 1.0),
                              ),
                              child: Form(
                                key: formkey,
                                child:  TextFormField(
                                  controller: txtNom,
                                  keyboardType: TextInputType.name,
                                  onChanged: (String value) {
                                    print(value);
                                    _searchKeyWords(value);
                                  },
                                decoration: InputDecoration(
                                    // labelText: 'Search',
                                    hintText: "Filtrez par mots clés",
                                    contentPadding: EdgeInsets.only(
                                        top: 6, bottom: 4, left: 10),
                                    suffixIcon: Icon(Icons.search,
                                        color:
                                            Color(0xFF025CCB).withOpacity(1.0)),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none),
                                  )
                                )
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
                  _carList.length == 0 ?
                    Center(
                    child:  Container(
                    height: 450,
                    decoration: BoxDecoration(
                      // border: Border.all(width: 2.0),
                      image: DecorationImage(
                        // fit: BoxFit.cover,
                        image: AssetImage(
                          'images/ico.png',
                        ),
                      ),
                    ),
              ),
                  )
                  :
                  Container(
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
                  //paginator

                  Container(
                    padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                    child:
                    _isNotSearch
                    ?
                    NumberPaginator(
                      // by default, the paginator shows numbers as center content
                      numberPages: _total + 1,
                      onPageChange: (int index) {
                        setState(() {
                          _currentPage = index + 1;
                          retrieveCars(_currentPage);
                          // _currentPage =
                          // index; // _currentPage is a variable within State of StatefulWidget
                        });
                      },
                      // initially selected index
                      initialPage: 0,
                      config: NumberPaginatorUIConfig(
                        // default height is 48
                        // height: 64,
                        buttonShape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        buttonSelectedForegroundColor: Colors.white,
                        buttonUnselectedForegroundColor: Color(0xFF025CCB),
                        buttonUnselectedBackgroundColor: Colors.white,
                        buttonSelectedBackgroundColor: Color(0xFF025CCB),
                      ),
                    )
                  :
                  Text("")
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
                          _loadUserInfo();

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
