import 'dart:io';

import 'package:app/constant.dart';
import 'package:app/models/api_response.dart';
import 'package:app/pages/carsListPage.dart';
import 'package:app/pages/loginPage.dart';
import 'package:app/services/user_service.dart';
import 'package:app/services/car_service.dart';
import 'package:app/widgets/selectInt.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/formLabel.dart';
import 'package:app/widgets/Select.dart';
import 'package:app/widgets/formInputName.dart';
import 'package:app/widgets/Input.dart';
import 'package:app/widgets/DoubleSelect.dart';
import 'package:app/widgets/InputGroup.dart';
import 'package:app/widgets/TextArea.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:file_picker/file_picker.dart';
import '../models/user.dart';
import 'package:app/widgets/post_frame_callback.dart';
// import 'package:app/widgets/post_frame_callback_stateless.dart';

import '../models/user.dart';

class carsForm extends StatefulWidget {
  final User user;
  const carsForm({super.key, required this.user});

  @override
  State<carsForm> createState() => _carsFormState();
}

class _carsFormState extends State<carsForm> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _autovalidate = false;
  TextEditingController txtNom = TextEditingController(),
      txtDesc = TextEditingController(),
      txtNumberFisc = TextEditingController(),
      txtNumberDin = TextEditingController(),
      txtNumberPrix = TextEditingController(),
      txtNumberCyl = TextEditingController(),
      txtNumberKm = TextEditingController(),
      txtSellerie = TextEditingController(),
      txtCouleur = TextEditingController(),
      txtVille = TextEditingController(),
      txtPays = TextEditingController(),
      txtNumberCylindrees = TextEditingController();

  List<String> listMarque = [
    'peugeot',
    'Renault',
    'Opel',
    'Mercedes MI 450',
    'Toyota Tundra',
    'BMW',
    'Audi'
  ];
  List<String> listPortes = ['2', '4'];
  List<String> listPlaces = ['2', '5', '8', '20'];
  List<String> listYear = ['2017', '2018', '2019', '2020'];
  List<String> listBoite = [
    'Automatique',
    'MANUELLE 6 VITESSES',
    'MANUELLE 5 VITESSES',
    'MANUELLE 4 VITESSES',
    'MANUELLE 3 VITESSES'
  ];
  List<String> listType = [
    'Essence',
    'Gasoil',
    'Kerozen'
  ];
  String? _marque;
  String? _portes;
  String? _places;
  String? _year;
  String? _type;
  String? _boite;
  int? category;
  bool loading = false;
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading_1 = false;
  bool isLoading_2 = false;
  bool isLoading_3 = false;
  File? fileToDisplay_image1;
  File? fileToDisplay_image2;
  File? fileToDisplay_image3;
  List<File?> images = [];
  List<String?> _images = ['', '', ''];

  @override
  void initState() {
    super.initState();

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

    // // _marque = listMarque[0];
    // _portes = listPortes[0];
    // _places = listPlaces[0];
    // _year = listYear[0];
    // _type = listType[0];
    images = [fileToDisplay_image1, fileToDisplay_image2, fileToDisplay_image3];
  }

  void pickFile_image1() async {
    try {
      setState(() {
        isLoading_1 = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay_image1 = File(pickedfile!.path.toString());
      }

      setState(() {
        isLoading_1 = false;
        images[0] = fileToDisplay_image1;
      });
    } catch (e) {}
  }

  void pickFile_image2() async {
    try {
      setState(() {
        isLoading_2 = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay_image2 = File(pickedfile!.path.toString());
      }

      setState(() {
        isLoading_2 = false;
        images[1] = fileToDisplay_image2;
      });
    } catch (e) {}
  }

  void pickFile_image3() async {
    try {
      setState(() {
        isLoading_3 = true;
      });

      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay_image3 = File(pickedfile!.path.toString());
      }

      setState(() {
        images[2] = fileToDisplay_image3;
        isLoading_3 = false;
      });
    } catch (e) {}
  }

  void _createCar() async {
    print(images);
    for (var i = 0; i < images.length; i++) {
      // _images[i] = images[i] == null ? null : getStringImage(images[i]);
      _images[i] = getStringImage(images[i]);
    }
    print(_images[0]);
    print(_type);
    print(_year);
    print(_marque);
    print(_portes);
    print(_places);

    ApiResponse response = await createCar(
        txtNom.text,
        _images,
        category,
        // 1,
        _type,
        _year,
        _marque,
        txtNumberFisc.text != '' ? int.parse(txtNumberFisc.text) : null,
        txtNumberDin.text != '' ? int.parse(txtNumberDin.text) : null,
        txtDesc.text,
        txtNumberCyl.text != '' ? int.parse(txtNumberCyl.text) : null,
        txtNumberPrix.text != '' ? int.parse(txtNumberPrix.text) : null,
        _portes,
        _places,
        _boite,
        txtNumberKm.text != '' ? int.parse(txtNumberKm.text) : null,
        txtSellerie.text,
        txtCouleur.text,
        txtNumberCylindrees.text != '' ? int.parse(txtNumberCylindrees.text) : null,
        txtVille.text,
        txtPays.text
        );
    print(response);

    if (response.error == null) {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => carsForm(user: widget.user)),
      //     (route) => false);
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => loginPage()),
                (route) => false)
          });
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
          child: Form(
        key: formkey,
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
                              pickFile_image1();
                            },
<<<<<<< HEAD
                            child: isLoading_1
=======
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
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
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
<<<<<<< HEAD
                                          if (pickedfile != null &&
                                              fileToDisplay_image1 != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(
                                                  fileToDisplay_image1!),
                                            )
                                          else
                                            Icon(
                                              Icons.photo_outlined,
                                              size: 60,
=======
                                          Icon(
                                            Icons.photo_outlined,
                                            size: 60,
                                          ),
                                          if (pickedfile != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(fileToDisplay!),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                                            ),
                                        ]),
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pickFile_image2();
                            },
                            child: isLoading_2
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
<<<<<<< HEAD
                                          if (pickedfile != null &&
                                              fileToDisplay_image2 != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(
                                                  fileToDisplay_image2!),
                                            )
                                          else
                                            Icon(
                                              Icons.photo_outlined,
                                              size: 60,
=======
                                          Icon(
                                            Icons.photo_outlined,
                                            size: 60,
                                          ),
                                          if (pickedfile != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(fileToDisplay!),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
                                            ),
                                        ]),
                                  ),
                          ),
<<<<<<< HEAD
                          GestureDetector(
                            onTap: () {
                              pickFile_image3();
                            },
                            child: isLoading_3
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
                                          if (pickedfile != null &&
                                              fileToDisplay_image3 != null)
                                            SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.file(
                                                  fileToDisplay_image3!),
                                            )
                                          else
                                            Icon(
                                              Icons.photo_outlined,
                                              size: 60,
                                            ),
                                        ]),
                                  ),
                          ),
=======
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
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
                    formInputName(txtName: txtNom),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Catégorie', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(1, 1)),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonFormField<int>(
                          value: category,
                          validator: (value) =>
                              value == null ? 'champ requis' : null,
                          isExpanded: true,
                          iconEnabledColor: Colors.black,
                          iconSize: 25,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          padding: EdgeInsets.symmetric(vertical: 0),
                          items: ['coupé', 'hayon', 'berline']
                              .asMap()
                              .entries
                              .map(buildMenuItemInt)
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              category = value;
                            });
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Boite de vitesse', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(1, 1)),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonFormField<String>(
                          value: _boite,
                          validator: (value) =>
                              value == null ? 'champ requis' : null,
                          isExpanded: true,
                          iconEnabledColor: Colors.black,
                          iconSize: 25,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          padding: EdgeInsets.symmetric(vertical: 0),
                          items: listBoite.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              _boite = value;
                            });
                            // print(option);
                            // print(this.widget.option);
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  formLabel(text: 'Année', size: 12),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 10,
                                            offset: Offset(1, 1)),
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                        value: _year,
                                        validator: (value) => value == null
                                            ? 'champ requis'
                                            : null,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.black,
                                        iconSize: 25,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        items: listYear
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _year = value;
                                          });
                                          // print(option);
                                          // print(this.widget.option);
                                        }),
                                  ),
                                ]),
                          ),
                          Container(
                            width: 150,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  formLabel(text: 'Type', size: 12),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 10,
                                            offset: Offset(1, 1)),
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                        value: _type,
                                        validator: (value) => value == null
                                            ? 'champ requis'
                                            : null,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.black,
                                        iconSize: 25,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        items: listType
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _type = value;
                                          });
                                          // print(option);
                                          // print(this.widget.option);
                                        }),
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  formLabel(
                                      text: 'Nombre de portières', size: 12),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 10,
                                            offset: Offset(1, 1)),
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                        value: _portes,
                                        validator: (value) => value == null
                                            ? 'champ requis'
                                            : null,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.black,
                                        iconSize: 25,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        items: listPortes
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _portes = value;
                                          });
                                          // print(option);
                                          // print(this.widget.option);
                                        }),
                                  ),
                                ]),
                          ),
                          Container(
                            width: 150,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  formLabel(text: 'Nombre de places', size: 12),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            blurRadius: 10,
                                            offset: Offset(1, 1)),
                                      ],
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                        value: _places,
                                        validator: (value) => value == null
                                            ? 'champ requis'
                                            : null,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.black,
                                        iconSize: 25,
                                        icon: Icon(
                                            Icons.keyboard_arrow_down_rounded),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        items: listPlaces
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            _places = value;
                                          });
                                          // print(option);
                                          // print(this.widget.option);
                                        }),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Marque', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              offset: Offset(1, 1)),
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: DropdownButtonFormField<String>(
                          value: _marque,
                          validator: (value) =>
                              value == null ? 'champ requis' : null,
                          isExpanded: true,
                          iconEnabledColor: Colors.black,
                          iconSize: 25,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          padding: EdgeInsets.symmetric(vertical: 0),
                          items: listMarque.map(buildMenuItem).toList(),
                          onChanged: (value) {
                            setState(() {
                              _marque = value;
                            });
                            // print(option);
                            // print(this.widget.option);
                          }),
                    ),
                    Group(label: 'Puissance Fiscale', txtNumber: txtNumberFisc),
                    Group(label: 'Puissance DIN', txtNumber: txtNumberDin),
                    Group(
                        label: 'Nombre de cylindres', txtNumber: txtNumberCyl),
                    Group(label: 'Prix', txtNumber: txtNumberPrix),
                    Group(label: 'Kilométrage', txtNumber: txtNumberKm),
                    Group(label: 'Cylindrées', txtNumber: txtNumberCylindrees),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Couleur du véhicule', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    formInputName(txtName: txtCouleur),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Sellerie du véhicule', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    formInputName(txtName: txtSellerie),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Ville', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                     formInputName(txtName: txtVille),
                    SizedBox(
                      height: 20,
                    ),
                    formLabel(text: 'Pays', size: 12),
                    SizedBox(
                      height: 15,
                    ),
                    formInputName(txtName: txtPays),
                    TextArea(txtDesc: txtDesc),
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
                              loading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
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
                                        onPressed: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            // If the form is valid, display a snackbar. In the real world,
                                            // you'd often call a server or save the information in a database.
                                            // ScaffoldMessenger.of(context).showSnackBar(
                                            //   const SnackBar(content: Text('Succès!!!')),
                                            // );
                                          }
                                          _createCar();

                                          _onBackButtonPressed(context);
                                        },
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
<<<<<<< HEAD
      )),
=======
      ),
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
      bottomNavigationBar: bottomNavigationBar(user: widget.user),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String option_1) {
    return DropdownMenuItem(
        value: option_1,
        child: Text(
          option_1,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ));
  }

  DropdownMenuItem<int> buildMenuItemInt(e) {
    return DropdownMenuItem(
        value: e.key + 1,
        child: Text(
          e.value,
          style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500),
        ));
  }

  Future<bool?> _onBackButtonPressed(BuildContext context) async {
    bool? exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Cars"),
              content: const Text('Voiture enregistrée avec succès!!!'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('ok'))
              ]);
        });
  }
}
