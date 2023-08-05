import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/textSpan.dart';
import 'package:app/widgets/formInput.dart';
import 'package:app/widgets/bgBlue.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/registerPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Indexer(
                children: [
                  bgBlue(),
                  Indexed(
                      index: 2,
                      child: Center(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 40, left: 20, right: 20),
                          margin: EdgeInsets.only(
                            top: 130,
                          ),
                          width: 280,
                          height: 450,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5.0,
                                  offset: Offset(0, 5)),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Login',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF025CCB),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins')),
                              SizedBox(
                                height: 30,
                              ),
                              formLabel(text: 'Username'),
                              SizedBox(
                                height: 15,
                              ),
                              formInput(icon: Icons.person),
                              SizedBox(
                                height: 15,
                              ),
                              formLabel(text: 'Mot de passe'),
                              SizedBox(
                                height: 15,
                              ),
                              formInput(icon: Icons.key),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  Text('mot de passe oublié?',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFF025CCB),
                                      Color(0xFF022C94)
                                    ],
                                  ),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Main(),
                                        ));
                                  },
                                  minWidth: double.infinity,
                                  child: Text('Login',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500)),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              // textSpan(text: "vous n'avez pas de compte ? ",
              // span: 'créer un compte'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("vous n'avez pas de compte ? ",
                  style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => registerPage(),
                          ));
                    },
                    child: Text(
                      'créer un compte',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF025CCB),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
