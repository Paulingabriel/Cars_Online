import 'package:flutter/material.dart';
import 'package:app/widgets/bottomNavigationBar.dart';

class editPassword extends StatefulWidget {
  const editPassword({super.key});

  @override
  State<editPassword> createState() => _editPasswordState();
}

class _editPasswordState extends State<editPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: Text('Modifier mot de passe',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600)),
              ),
              Center(
                  child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      margin: EdgeInsets.only(top: 30),
                      child: CircleAvatar(
                        radius: 64,
                        backgroundImage: AssetImage('images/profil.png'),
                      )),
                  Transform.translate(
                    offset: Offset(85, 115),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF025CCB)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_square,
                            color: Colors.white,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility, color: Colors.black),
                    labelText: 'Ancien mot de passe',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility, color: Colors.black),
                    labelText: 'Nouveau mot de passe',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.visibility, color: Colors.black),
                    labelText: 'Confirmation mot de passe',
                    hintStyle: TextStyle(fontFamily: 'Poppins')),
              ),
              SizedBox(
                height: 20,
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
                      colors: [
                        Color.fromARGB(255, 20, 67, 184),
                        Color(0xFF025CCB)
                      ],
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
      bottomNavigationBar: bottomNavigationBar(),
    );
    ;
  }
}
