import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/car_service.dart';
import 'package:app/services/user_service.dart';
import 'package:app/utils/ListCars.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/widgets/Mail.dart';
import 'package:number_paginator/number_paginator.dart';
// import 'package:app/utils/Property.dart';

import '../models/user.dart';

import '../models/user.dart';

class Notifications extends StatefulWidget {
  final User? user;

  const Notifications({super.key, required this.user});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<dynamic> _carsList = [];
   bool _loading = true;
   int _currentPage = 1;
    var _total;

  int userId = 0;

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

  @override
  void initState() {
    retrieveCars(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF025CCB), Color(0xFF022C94)],
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 85,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30, bottom: 5),
                        child: Text('Notifications',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Poppins')),
                      ),
                    ])),
          ),
          preferredSize: Size.fromHeight(100)),
      body:
       _loading
            ? Center(
                  child: CircularProgressIndicator(),
              )
        :
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 8, right: 8),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _carsList.length,
                  itemBuilder: (context, index) {
                    final prop = _carsList[index];
                    return Dismissible(
                        key: Key(prop.carId.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            _carsList.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Notification supprimée')));
                          });
                        },
                        background: Container(
                          color: Color(0xFF025CCB),
                        ),
                        child: Mail(property: prop, user: widget.user));
                  }),
            ),
             //paginator

                  Container(
                        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
                        child:  NumberPaginator(
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
                    ),
                  ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }
}
