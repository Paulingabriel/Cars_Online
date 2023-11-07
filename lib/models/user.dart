class User {
  int? id;
  String? image;
  String? tel;
  String? name;
  String? pseudo;
  String? email;
  String? token;

  User({this.id, this.image, this.tel, this.name, this.pseudo, this.email, this.token});

  //fonction de conversion des donnees json en user model

  factory User.fromJson(Map<String, dynamic> json) {
    return User(

        id: json['user']['id'],
        image: json['user']['image'],
        tel: json['user']['tel'],
        name: json['user']['name'],
        pseudo: json['user']['pseudo'],
        email: json['user']['email'],
        token: json['token']
        );

  }
}
