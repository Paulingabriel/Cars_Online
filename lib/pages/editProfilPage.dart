import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/carsListPage.dart';
import 'package:app/pages/editProfilPage.dart';

class editProfilPage extends StatefulWidget {
  const editProfilPage({super.key});

  @override
  State<editProfilPage> createState() => _editProfilPageState();
}

class _editProfilPageState extends State<editProfilPage> {
  int _currentTab = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Text('Editer le profil',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600)),
              ),
              Center(
                  child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      margin: EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage('images/profil.png'),
                      ))),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nom',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Prenom',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
              ),
              SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                    labelText: 'Numero',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
                initialCountryCode: 'DE',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [ Color.fromARGB(255, 20, 67, 184),Color(0xFF025CCB)],
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text("Enregistrer",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            ]),
          )
        ],
      )),
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
                              builder: (context) => Main(),
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
                              builder: (context) => carsList(),
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
                              builder: (context) => editProfilPage(),
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
