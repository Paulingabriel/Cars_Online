import 'dart:io';

import 'package:app/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:file_picker/file_picker.dart';

import '../models/user.dart';

class editProfilPage extends StatefulWidget {
  final User user;
  const editProfilPage({super.key, required this.user});

  @override
  State<editProfilPage> createState() => _editProfilPageState();
}

class _editProfilPageState extends State<editProfilPage> {
  int _currentTab = 2;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isUploaded = false;
  TextEditingController txtName = TextEditingController(),
      txtPseudo = TextEditingController(),
      txtTel = TextEditingController(),
      txtEmail = TextEditingController();
  String? _fileName;
  FilePickerResult? result;
  PlatformFile? pickedfile;
  File? fileToDisplay;



  //function to edit use

  void _editCar() async {
    // print(widget.user.name);
  }

  //importer l'image depuis les fichiers du telephone
  void pickFile() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        print(fileToDisplay);
        setState(() {
          isUploaded = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    txtName.text = widget.user.name ?? "";
    txtEmail.text = widget.user.email ?? "";
    txtPseudo.text = widget.user.pseudo ?? "";
    txtTel.text = widget.user.tel ?? "";
    print("Bonsoir!!!");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: Text('Editer le profil',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600)),
                      ),
                      Center(
                          child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickFile();
                            },
                            child: !isUploaded
                                ? Container(
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    margin: EdgeInsets.only(top: 20),
                                    child: CircleAvatar(
                                      radius: 64,
                                      backgroundImage:
                                          AssetImage('images/profil.png'),
                                    ))
                                : Container(
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    margin: EdgeInsets.only(top: 20),
                                    child: CircleAvatar(
                                      radius: 64,
                                      child: ClipOval(
                                        child: new SizedBox(
                                            width: 130,
                                            height: 130,
                                            child: Image.file(
                                              fileToDisplay!,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      // child: Image.file(fileToDisplay!, fit: BoxFit.fill,)
                                    )),
                          ),
                          Transform.translate(
                            offset: Offset(90, 110),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF025CCB)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        pickFile();
                                      },
                                      child: Icon(
                                        Icons.edit_square,
                                        color: Colors.white,
                                        size: 15,
                                      ))
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
                        controller: txtName,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Nom',
                            hintStyle: TextStyle(fontFamily: 'Poppins')),
                        // onSaved: (value) {
                        //   txtName = value;
                        // },
                        // validator: (val) {
                        //   if (val!.length < 3 && val.isNotEmpty) {
                        //     return 'Au moins 3 charactères requis.';
                        //   } else if (val.isEmpty) {
                        //     return 'Le champ nom est requis.';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: txtPseudo,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Prenom',
                            hintStyle: TextStyle(fontFamily: 'Poppins')),
                        onSaved: (value) {
                          // _nom = value;
                        },
                        validator: (val) {
                          if (val!.length < 3 && val.isNotEmpty) {
                            return 'Au moins 3 charactères requis.';
                          } else if (val.isEmpty) {
                            return 'Le champ prenom requis.';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: txtEmail,
                        validator: (val) {
                          if (val!.length < 3) {
                            return 'Au moins 3 charactères requis.';
                          } else if (val.isEmpty) {
                            return 'Le champ email requis.';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintStyle: TextStyle(fontFamily: 'Poppins')),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      IntlPhoneField(
                        keyboardType: TextInputType.phone,
                        controller: txtTel,
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
                              colors: [
                                Color.fromARGB(255, 20, 67, 184),
                                Color(0xFF025CCB)
                              ],
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              _editCar();
                            },
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
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }
}
