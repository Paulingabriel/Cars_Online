import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/textSpan.dart';
import 'package:app/widgets/formInput.dart';
import 'package:app/widgets/bgBlue.dart';
import 'package:app/pages/loginPage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:  Column(
        children: [
          Indexer(
            children: [
              bgBlue(),
              Indexed(
                index: 2,
                child: Center(
                child: Container(
                padding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 20,
                        right: 20),
                margin: EdgeInsets.only(
                        top: 50,),
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
                    style: TextStyle(fontSize: 20, color: Color(0xFF025CCB), fontWeight: FontWeight.w600, fontFamily: 'Poppins')),
                    SizedBox(height: 20,),
                    formLabel(text: 'Nom'),
                    SizedBox(height: 15,),
                    formInput(icon: Icons.person),
                    SizedBox(height: 15,),
                    formLabel(text: 'Prenom'),
                    SizedBox(height: 15,),
                    formInput(icon: Icons.person),
                    SizedBox(height: 15,),
                    formLabel(text: 'Adresse email'),
                    SizedBox(height: 15,),
                    formInput(icon: Icons.email),
                    SizedBox(height: 15,),
                    formLabel(text: 'Numero de téléphone'),
                    SizedBox(height: 15,),
                    Container(
                      height: 48,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 15,
                              offset: Offset(1, 1)),
                          ],      
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          InternationalPhoneNumberInput(
                        onInputChanged: (value) {},
                        cursorColor: Colors.black,
                        formatInput: false,
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 15, left:0),
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 32,
                            width: 1,
                            color: Colors.black.withOpacity(0.13)
                          ),
                        )
                        ],
                      )),
                    SizedBox(height: 15,),
                    formLabel(text: 'Mot de passe'),
                    SizedBox(height: 15,),
                    formInput(icon: Icons.visibility_off),
                    SizedBox(height: 15,),
                    formLabel(text: 'Confirmation mot de passe'),
                    SizedBox(height: 15,),
                    formInput(icon: Icons.visibility_off),
                    SizedBox(height: 25,),
                    Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF025CCB), Color(0xFF022C94)],
                        ),
                      ),
                      child: MaterialButton(
                            onPressed: () {},
                            minWidth: double.infinity,
                            child: Text("S'inscrire",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                      ),)
                    ],
                ),
              ),
              )),
            ],
          ),
        SizedBox(height: 30,),
        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("vous avez déjà un compte ? ",
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
        SizedBox(height: 20,),
        ],
      ),
    
      ));;
  }
}