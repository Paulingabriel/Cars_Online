import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/Notifications.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/widgets/CarteOptions.dart';
import 'package:app/widgets/Navbar.dart';
import 'package:app/widgets/paginator.dart';
import 'package:flutter/material.dart';
import 'package:app/models/carsModels.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/pages/carDescriptionPage.dart';
import 'package:app/Modal/ModalFilter.dart';
// import 'package:app/utils/Property.dart';
import 'package:app/widgets/Carte.dart';
import 'package:number_paginator/number_paginator.dart';

import '../models/user.dart';

class Cars extends StatefulWidget {
  final User user;
  const Cars({super.key, required this.user});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  PageController pageController = PageController(viewportFraction: 0.45);
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtNom = TextEditingController();
  List<dynamic?> _carsList = [];
  bool _loading = true;
  int _currentPage = 1;
  var _isNotSearch = true;
  var _total;

  int userId = 0;

  // void _openModalFilter(BuildContext ctx) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       backgroundColor: Colors.transparent,
  //       context: ctx,
  //       builder: (_) {
  //         return FractionallySizedBox(
  //           heightFactor: 0.63,
  //           child: ModalFilter(),
  //         );
  //       });
  // }

  Future<void> retrieveCars(_currentPage) async {
    print('bonjour');
    int page = _currentPage;
    userId = await getUserId();
    ApiResponse response = await getCars(page);
    print(response.error);

    if (response.error == null) {
      setState(() {
        _carsList = response.data as List<dynamic>;
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
        _carsList = response.data as List<dynamic>;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 237, 238),
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
                            child: Form(
                              key: formkey,
                              child: TextFormField(
                                controller: txtNom,
                                  keyboardType: TextInputType.name,
                                  onChanged: (String value) {
                                    print(value);
                                    _searchKeyWords(value);
                                  },
                              decoration: InputDecoration(
                                // labelText: 'Search',
                                hintText: "Rechercher un véhicule",
                                contentPadding: EdgeInsets.only(top: 10, bottom: 3, left: 15),
                                suffixIcon: Icon(Icons.search, color: Color(0xFF025CCB).withOpacity(1.0)),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none
                            ),
                            ),)
                          )
                        ],
                      )
                    ])),
          ),
          preferredSize: Size.fromHeight(135)),
      // backgroundColor: Colors.white,
      body:
       _loading
            ? Center(
                  child: CircularProgressIndicator(),
              )
        :
      SingleChildScrollView(
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
             _carsList.length == 0 ?
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
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _carsList.length,
                  itemBuilder: (context, index) {
                    return CarteOptions(
                        property: _carsList[index], user: widget.user);
                  }),
            ),
            //Paginator
                 Container(
                  padding: EdgeInsets.only(top: 20, bottom:20, left: 8, right: 8),
                  child:
                   _isNotSearch
                    ?
                  NumberPaginator(
                    // by default, the paginator shows numbers as center content
                    numberPages: _total,
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
                    )
                  )
                   :
                  Text("")
                ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }
}
