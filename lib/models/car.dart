import 'package:app/models/user.dart';

class Car {
  int? carId;
  String? nom;
  // List<String> images;
  int? categoryId;
  // User? user;
  String? type;
  String? annee;
  String? marque;
  int? pfisc;
  int? pdin;
  String? desc;
  int? cyl;
  int? prix;
  String? portiere;
  String? place;
  String? boite;
  int? km;
  String? sellerie;
  String? couleur;
  int? cylindrees;
  String? ville;
  String? pays;

  Car(
      {this.carId,
      this.nom,
      // this.images,
      this.categoryId,
      // this.user,
      this.type,
      this.annee,
      this.marque,
      this.pfisc,
      this.pdin,
      this.desc,
      this.cyl,
      this.prix,
      this.portiere,
      this.place,
      this.boite,
      this.km,
      this.sellerie,
      this.couleur,
      this.cylindrees,
      this.ville,
      this.pays,
      });

  //map json to Car model

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        carId: json['cars']['id'],
        nom: json['cars']['nom'],
        // images: 
        // json['cars']['images'].split(',') == [null, null , null] ? [] :
        // json['cars']['images'].split(','),

        categoryId: int.parse(json['cars']['category_id']),
        // user: json['cars']['user'] == null
        //     ? User()
        //     : User(
        //         id: json['cars']['user']['id'],
        //         tel: json['cars']['user']['tel'],
        //         name: json['cars']['user']['name'],
        //         pseudo: json['cars']['user']['pseudo'],
        //         email: json['cars']['user']['email']),
        type: json['cars']['type'],
        annee: json['cars']['annee'],
        marque: json['cars']['marque'],
        pfisc: int.parse(json['cars']['pfisc']),
        pdin: int.parse(json['cars']['pdin']),
        desc: json['cars']['desc'],
        cyl: int.parse(json['cars']['cyl']),
        prix: int.parse(json['cars']['prix']),
        portiere: json['cars']['portiere'],
        place: json['cars']['place'],
        boite: json['cars']['boite'],
        km: int.parse(json['cars']['km']),
        sellerie: json['cars']['sellerie'],
        couleur: json['cars']['couleur'],
        cylindrees: int.parse(json['cars']['cylindrees']),
        ville: json['cars']['ville'],
        pays: json['cars']['pays']
        );
  }
}
