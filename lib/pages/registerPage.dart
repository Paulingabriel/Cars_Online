import 'package:app/pages/PackPage.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/formInputName.dart';
import 'package:app/widgets/formInputEmail.dart';
import 'package:app/widgets/formInputPassword.dart';
import 'package:app/widgets/bgBlue.dart';
import 'package:app/pages/loginPage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/api_response.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../widgets/formInputPasswordConfirm.dart';
import 'MainPage.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool loading = false;
  String txtTel = '';
  TextEditingController txtName = TextEditingController(),
      txtPseudo = TextEditingController(),
      // txtTel = TextEditingController(),
      txtEmail = TextEditingController(),
      txtPassword = TextEditingController(),
      txtPasswordConfirm = TextEditingController();

  void _registerUser() async {
    ApiResponse response = await register(txtName.text, txtPseudo.text,
        txtTel, txtEmail.text, txtPassword.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      print(response);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${response.error}'),
      ));
    }
  }

  // Save and redirect to home
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('accessToken', user.token ?? '');
    await pref.setString('userId', user.id ?? '');
    String token = await getToken();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => PackPage(user: user)),
        (route) => false);
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
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 20, right: 20),
                          margin: EdgeInsets.only(
                            top: 50,
                          ),
                          width: 280,
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
                              const Text('Register',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF025CCB),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins')),
                              SizedBox(
                                height: 20,
                              ),
                              formLabel(text: 'Nom', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              formInputName(
                                icon: Icons.person,
                                txtName: txtName,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              formLabel(text: 'Prenom', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              formInputName(
                                icon: Icons.person,
                                txtName: txtPseudo,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              formLabel(text: 'Adresse email', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              formInputEmail(
                                icon: Icons.email,
                                txtEmail: txtEmail,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              formLabel(text: 'Numero de téléphone', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              Indexer(
                                children: [
                                  Indexed(
                                    index: 1,
                                    child: Container(
                                      height: 48,
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 15,
                                              offset: Offset(1, 1)),
                                        ],
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  Indexed(
                                      index: 3,
                                      child: Stack(
                                        children: [
                                          InternationalPhoneNumberInput(
                                              // textFieldController: txtTel,
                                              keyboardType: TextInputType.phone,
                                              cursorColor: Colors.black,
                                              formatInput: false,
                                              selectorConfig: SelectorConfig(
                                                selectorType:
                                                    PhoneInputSelectorType
                                                        .BOTTOM_SHEET,
                                              ),
                                              inputDecoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    bottom: 15, right: 10),
                                                hintText: 'Phone Number',
                                                hintStyle: TextStyle(
                                                  color: Colors.grey.shade500,
                                                  fontSize: 14,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              onInputChanged:
                                                  (PhoneNumber Number) {
                                                setState(() {
                                                  txtTel = Number.phoneNumber.toString();
                                                });
                                                print(Number);
                                              }),
                                          // Positioned(
                                          //   left: 90,
                                          //   top: 8,
                                          //   bottom: 8,
                                          //   child: Container(
                                          //       height: 32,
                                          //       width: 1,
                                          //       color:
                                          //           Colors.black.withOpacity(0.13)),
                                          // )
                                        ],
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              formLabel(text: 'Mot de passe', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              formInputPassword(
                                icon: Icons.visibility_off,
                                txtPassword: txtPassword,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              formLabel(
                                  text: 'Confirmation mot de passe', size: 12),
                              SizedBox(
                                height: 15,
                              ),
                              formInputPasswordConfirm(
                                icon: Icons.visibility_off,
                                txtPassword: txtPassword,
                                txtPasswordConfirm: txtPasswordConfirm,
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
                                              _registerUser();
                                            });
                                          }
                                        },
                                        minWidth: double.infinity,
                                        child: Text("S'inscrire",
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "vous avez déjà un compte ? ",
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
                            builder: (context) => loginPage(),
                          ));
                    },
                    child: Text(
                      'Se Connecter',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF025CCB),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )));
  }
}
