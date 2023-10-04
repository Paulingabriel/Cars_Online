import 'package:app/models/api_response.dart';
import 'package:app/pages/PackPage.dart';
import 'package:app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/formInputEmail.dart';
import 'package:app/widgets/formInputPassword.dart';
import 'package:app/widgets/bgBlue.dart';
import 'package:app/pages/MainPage.dart';
import 'package:app/pages/registerPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  void _loginUser() async {
    ApiResponse response = await login(txtEmail.text, txtPassword.text);
    if (response.error == null) {
      print('bonjour');
      _saveAndRedirectToHome(response.data as User);
    } else {
      print('bonsoir');
      setState(() {
        loading = false;
      });
      print(response.error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  // Save and redirect to home
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
<<<<<<< HEAD
    await pref.setString('token', user.token ?? '');
    await pref.setInt('id', user.id ?? 0);
    await pref.setString('name', user.name ?? '');
    await pref.setString('pseudo', user.pseudo ?? '');
    await pref.setString('email', user.email ?? '');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => PackPage(user: user)), (route) => false);
=======
    await pref.setString('accessToken', user.token ?? '');
    await pref.setString('userId', user.id ?? '');
     await pref.setString('lastname', user.name ?? '');
    await pref.setString('firstName', user.pseudo ?? '');
    await pref.setString('email', user.email ?? '');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => PackPage(user: user)),
        (route) => false);
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
          key: formkey,
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
                              formLabel(text: 'Email', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              formInputEmail(
                                icon: Icons.person,
                                txtEmail: txtEmail,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              formLabel(text: 'Mot de passe', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              formInputPassword(
                                icon: Icons.key,
                                txtPassword: txtPassword,
                              ),
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
                              loading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
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
                                          if (formkey.currentState!
                                              .validate()) {
                                            setState(() {
                                              loading = true;
                                              _loginUser();
                                            });
                                          }
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) => Main(),
                                          //     ));
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
                  Text(
                    "vous n'avez pas de compte ? ",
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
        )));
  }
}
