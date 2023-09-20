import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/Select.dart';
import 'package:app/widgets/Input.dart';
import 'package:app/widgets/DoubleSelect.dart';
import 'package:app/widgets/InputGroup.dart';
import 'package:app/widgets/TextArea.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:file_picker/file_picker.dart';

import '../models/user.dart';

class carsForm extends StatefulWidget {
  final User user;
  const carsForm({super.key, required this.user});

  @override
  State<carsForm> createState() => _carsFormState();
}

class _carsFormState extends State<carsForm> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;

  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {}
  }

  // void openFiles() async {
  //   FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
  //   if (resultFile != null) {
  //     PlatformFile? file = resultFile.files.first;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Color(0xFF025CCB).withOpacity(1.0), BlendMode.hardLight),
                  image: AssetImage(
                    'images/car7.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 75, bottom: 0),
                        child: Text('Formulaire ajout de véhicules',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Poppins')),
                      ),
                    ])),
          ),
          preferredSize: Size.fromHeight(100)),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            // decoration: BoxDecoration(border: Border.all(width: 1.0)),
            child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Text("Veuillez entrer les informations de votre véhicule",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 25,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Photos du véhicule",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickFile();
                            },
                            child: isLoading
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.all(40),
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5)),
                                        ],
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.white),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.photo_outlined,
                                            size: 60,
                                          ),
                                          if (pickedfile != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(fileToDisplay!),
                                            ),
                                        ]),
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pickFile();
                            },
                            child: isLoading
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.all(40),
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5)),
                                        ],
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.white),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.photo_outlined,
                                            size: 60,
                                          ),
                                          if (pickedfile != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(fileToDisplay!),
                                            ),
                                        ]),
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pickFile();
                            },
                            child: isLoading
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    padding: EdgeInsets.all(40),
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5)),
                                        ],
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.white),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.photo_outlined,
                                            size: 60,
                                          ),
                                          if (pickedfile != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(fileToDisplay!),
                                            ),
                                        ]),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Nom du véhicule', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    Input(),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Catégorie', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    Select(),
                    SizedBox(
                      height: 20,
                    ),
                    Double(label1: 'Année', label2: 'Type'),
                    SizedBox(
                      height: 20,
                    ),
                    Double(
                        label1: 'Nombre de portières',
                        label2: 'Nombre de places'),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Marque', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    Select(),
                    Group(
                      label: 'Puissance Fiscale',
                    ),
                    Group(
                      label: 'Puissance DIN',
                    ),
                    Group(
                      label: 'Nombre de cylindres',
                    ),
                    Group(
                      label: 'Prix',
                    ),
                    TextArea(),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              // border: Border.all(width: 1.0)
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 45,
                                width: 190,
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
                              Container(
                                height: 45,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Color(0xFF025CCB), width: 1.0)),
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Reset",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF025CCB),
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600))
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }
}
