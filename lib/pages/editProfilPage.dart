import 'dart:io';

import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String? image = '';
  FilePickerResult? result;
  PlatformFile? pickedfile;
  File? fileToDisplay;

  void initState() {
    super.initState();

    //alert modal
    Future<void> _showDialog(BuildContext context) async {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text('Dialog content'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Accept'),
              ),
            ],
          ),
        );
      });
    }
  }

  //display alert Modal
  Future<bool?> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Cars"),
              content: const Text('Profil modifié avec succès!!!'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('ok'))
              ]);
        });
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

  //function to edit use
  void _editProfil() async {
    //encode file to base64 and get String image.
    if (fileToDisplay == null) {
      String? image = widget.user.image;

      print([
        txtName.text,
        txtPseudo.text,
        txtTel.text,
        txtEmail.text,
        image,
      ]);

      ApiResponse response = await editProfil(
          image, txtName.text, txtPseudo.text, txtTel.text, txtEmail.text);

      if (response.error == null) {
        // Navigator.of(context).pop();
        _onBackButtonPressed(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    } else {
      String? image = getStringImage(fileToDisplay);

      print([
        txtName.text,
        txtPseudo.text,
        txtTel.text,
        txtEmail.text,
        image,
      ]);
      ApiResponse response = await editProfil(
          image, txtName.text, txtPseudo.text, txtTel.text, txtEmail.text);

      if (response.error == null) {
        // Navigator.of(context).pop();
        _onBackButtonPressed(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
  }

  // Save image in flutter application
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('id', user.id ?? 0);
    await pref.setString('name', user.name ?? '');
    await pref.setString('pseudo', user.pseudo ?? '');
    await pref.setString('email', user.email ?? '');
    await pref.setString('image', user.image ?? '');
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
                                    child: widget.user.image == null
                                        ? CircleAvatar(
                                            radius: 64,
                                            backgroundImage:
                                                AssetImage('images/profil.png'),
                                          )
                                        : CircleAvatar(
                                            radius: 64,
                                            backgroundImage: NetworkImage(
                                                widget.user.image as String),
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
                            offset: const Offset(90, 110),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
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
                                      child: const Icon(
                                        Icons.edit_square,
                                        color: Colors.white,
                                        size: 15,
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: txtName,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: txtPseudo,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
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
                      const SizedBox(
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
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            hintStyle: TextStyle(fontFamily: 'Poppins')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IntlPhoneField(
                        keyboardType: TextInputType.phone,
                        controller: txtTel,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
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
                              _editProfil();
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
