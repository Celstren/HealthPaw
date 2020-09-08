// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User(
      {this.name,
      this.lastName,
      this.secondLastName,
      this.image,
      this.password,
      this.email,
      this.phone,
      this.documentNumber,
      this.birthDay,
      this.type,
      this.active});

  String name;
  String lastName;
  String secondLastName;
  String image;
  String password;
  String email;
  int phone;
  String documentNumber;
  DateTime birthDay;
  int type;
  bool active;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["namevar"] ?? "",
        lastName: json["lastName"] ?? "",
        secondLastName: json["secondLastName"] ?? "",
        image: json["image"] ?? "",
        password: json["password"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"],
        documentNumber: json["documentNumber"] ?? "",
        birthDay: DateTime.parse(json["birthDay"]),
        type: json["type"] ?? 1,
        active: json["active"] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "namevar": name ?? "",
        "lastName": lastName ?? "",
        "secondLastName": secondLastName ?? "",
        "image": image ?? "",
        "password": password ?? "",
        "email": email ?? "",
        "phone": phone,
        "documentNumber": documentNumber ?? "",
        "birthDay": birthDay.toIso8601String(),
        "type": type ?? 1,
        "active": active ?? true,
      };
}
