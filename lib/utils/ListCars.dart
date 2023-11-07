
import 'package:app/models/user.dart';

class ListCars {
  int? carId;
  String? nom;
  List<String>? images;
  String? category;
  int? categoryId;
  User? user;
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

  ListCars(
      {this.carId,
      this.nom,
      this.images,
      this.category,
      this.categoryId,
      this.user,
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
      this.pays});

  //map json to Car model

  factory ListCars.fromJson(Map<String, dynamic> json) {

    var replace = json['images'].replaceAll('[', '');
    var replace2 = replace.replaceAll(']', '');
    var array = replace2.split(',');
    print(array[2].replaceAll('"', '').replaceAll('\\', ''));
    return ListCars(
        carId: json['id'],
        nom: json['nom'],
        images: array == [null, null, null] ? [] : array,
        category: json['category']['nom'],
        categoryId: json['category_id'],
        user: json['user'] == null
            ? User()
            : User(
                id: json['user']['id'],
                tel: json['user']['tel'],
                name: json['user']['name'],
                pseudo: json['user']['pseudo'],
                email: json['user']['email']),
        type: json['type'],
        annee: json['annee'].toString(),
        marque: json['marque'],
        pfisc: int.parse(json['pfisc']),
        pdin: int.parse(json['pdin']),
        desc: json['desc'],
        cyl: json['cyl'],
        prix: json['prix'],
        portiere: json['portiere'].toString(),
        place: json['place'].toString(),
        boite: json['boite'],
        km: json['km'],
        sellerie: json['sellerie'],
        couleur: json['couleur'],
        cylindrees: json['cylindrees'],
        ville: json['ville'],
        pays: json['pays']
        );
  }
}
