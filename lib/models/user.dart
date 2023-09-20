class User {
  String? id;
  String? tel;
  String? name;
  String? pseudo;
  String? email;
  String? token;

  User({this.id, this.tel, this.name, this.pseudo, this.email, this.token});

  //fonction de conversion des donnees json en user model

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['data']['user']['userId'],
        tel: json['data']['user']['phone'],
        name: json['data']['user']['lastName'],
        pseudo: json['data']['user']['firstName'],
        email: json['data']['user']['email'],
        token: json['data']['token']['accessToken']);
  }
}
