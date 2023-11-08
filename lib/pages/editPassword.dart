import 'dart:io';

import 'package:app/models/api_response.dart';
import 'package:app/services/user_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class editPassword extends StatefulWidget {
  final User user;
  const editPassword({super.key, required this.user});

  @override
  State<editPassword> createState() => _editPasswordState();
}

class _editPasswordState extends State<editPassword> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isUploaded = false;
  TextEditingController txtLastPass = TextEditingController(),
      txtNewPass = TextEditingController(),
      txtConfPass = TextEditingController();
  String? _fileName;
  bool _isInvalid = false;
  String? image = '';
  FilePickerResult? result;
  PlatformFile? pickedfile;
  File? fileToDisplay;
  var _isObscured = true;
  var _isObscured1 = true;
  var _isObscured2 = true;

  void initState() {
    super.initState();

    // _isObscured = true;
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
              content: const Text('Mot de passe modifié avec succès!!!'),
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
  void _editPassword() async {
    //encode file to base64 and get String image.
    if (fileToDisplay == null) {
      String? image = widget.user.image;

      print([
        txtLastPass.text,
        txtNewPass.text,
        txtConfPass.text,
        image,
      ]);

      ApiResponse response =
          await editPass(image, txtLastPass.text, txtNewPass.text);
      print(response.error);
      if (response.error == null) {
        setState(() {
          _isInvalid = false;
        });
        _onBackButtonPressed(context);
      } else {
        setState(() {
          _isInvalid = true;
        });
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('${response.error}'),
        // ));
      }
    } else {
      String? image = getStringImage(fileToDisplay);

      print([
        txtLastPass.text,
        txtNewPass.text,
        txtConfPass.text,
        image,
      ]);
      ApiResponse response =
          await editPass(image, txtLastPass.text, txtNewPass.text);
      if (response.error == null) {
        setState(() {
          _isInvalid = false;
        });
        // Navigator.of(context).pop();
        _onBackButtonPressed(context);
      } else {
        setState(() {
          _isInvalid = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${response.error}'),
        ));
      }
    }
  }

  // Save image in flutter application
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('image', user.image ?? '');
  }

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
                      child: Text('Modifier mot de passe',
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
                    Column(
                      children: [],
                    ),
                    TextFormField(
                      controller: txtLastPass,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                           icon: _isObscured
                                ? Icon(Icons.visibility_off, color: Colors.grey)
                                : Icon(Icons.visibility, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                          labelText: 'Ancien mot de passe',
                          hintStyle: TextStyle(fontFamily: 'Poppins')),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Mot de passe requis.';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(children: [
                      _isInvalid
                          ?
                          // Text("")
                          Container(
                              margin:
                                  EdgeInsetsDirectional.symmetric(vertical: 10),
                              child: Text(
                                "Mot de passe invalide.",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            )
                          : Text(""),
                    ]),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    TextFormField(
                      controller: txtNewPass,
                      obscureText: _isObscured2,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: _isObscured2
                                ? Icon(Icons.visibility_off, color: Colors.grey)
                                : Icon(Icons.visibility, color: Colors.black),
                            onPressed: () {
                              setState(() {
                                _isObscured2 = !_isObscured2;
                              });
                            },
                          ),
                          labelText: 'Nouveau mot de passe',
                          hintStyle: TextStyle(fontFamily: 'Poppins')),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Mot de passe requis.';
                        } else if (val!.length < 6) {
                          return 'Au moins 6 charactères';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: txtConfPass,
                      obscureText: _isObscured1,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: _isObscured1
                            ? Icon(Icons.visibility_off, color: Colors.grey)
                            : Icon(Icons.visibility, color: Colors.black),
                             onPressed: () {
                              setState(() {
                                _isObscured1 = !_isObscured1;
                              });
                            },
                          ),
                          labelText: 'Confirmation mot de passe',
                          hintStyle: TextStyle(fontFamily: 'Poppins')),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Mot de passe requis.';
                        } else if (val != txtNewPass.text) {
                          return 'Mot de passe de Confirmation incorrecte.';
                        } else {
                          return null;
                        }
                      },
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
                          onPressed: () {
                            // _editPassword();
                            if (formkey.currentState!.validate()) {
                              _editPassword();
                            }
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
      )),
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }
}
