class User {
<<<<<<< HEAD
  int? id;
=======
  String? id;
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
  String? tel;
  String? name;
  String? pseudo;
  String? email;
  String? token;

  User({this.id, this.tel, this.name, this.pseudo, this.email, this.token});

  //fonction de conversion des donnees json en user model

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
<<<<<<< HEAD
        id: json['user']['id'],
        tel: json['user']['tel'],
        name: json['user']['name'],
        pseudo: json['user']['pseudo'],
        email: json['user']['email'],
        token: json['token']
        );
=======
        id: json['data']['user']['userId'],
        tel: json['data']['user']['phone'],
        name: json['data']['user']['lastName'],
        pseudo: json['data']['user']['firstName'],
        email: json['data']['user']['email'],
        token: json['data']['token']['accessToken']);
>>>>>>> 435b8701060f6dc80e22ae2a1ac6bc65d44a3b88
  }
}
