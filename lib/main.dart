import 'package:app/models/user.dart';
import 'package:app/pages/DashboardCars.dart';
import 'package:app/pages/loadingPage.dart';
import 'package:app/pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/loadingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loadingPage(),
      // home: Cars(user: User()),
      // home: carDescriptionPage(property: Property(
      //   '1',
      //   'coupé',
      //   'Essence',
      //   'manuellle de 6 vitesses',
      //   '2019',
      //   '54000 kms',
      //   'jaune',
      //   'cuir noir',
      //   '5000 cm3',
      //   '8',
      //   '450 hp/450 ch',
      //   '36 cv fiscaux',
      //   '4 places',
      //   '2 portes',
      //   'images/car7.jpg',
      //   'Mercedes GL 450',
      //   'Annee 2019',
      //   'La Mercedes GLA 45 AMG 4MATIC 2016 est un veritable bolide de rallye déguisé pour la route.Je n\'exagère pas:ce super petit utilitaire est alimenté par le moteur à 4 cylindres de serie le plus puissant au monde.exception faite des hybrides.',
      //   'Munich',
      //   'Allemagne',
      //   '4000,000£',
      //   'Automatique',
      // )),
    );
  }
}
