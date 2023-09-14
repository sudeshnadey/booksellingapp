import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  dynamic emailid;
  String password;
  String phone;
  String name;

  User({
    required this.id,
    required this.emailid,
    required this.password,
    required this.phone,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        emailid: json["emailid"],
        password: json["password"],
        phone: json["phone"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "emailid": emailid,
        "password": password,
        "phone": phone,
        "name": name,
      };
}
