// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:HealthPaw/models/pet/pet.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User(
      {this.name,
      this.lastName,
      this.secondLastName,
      this.pets,
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
  List<UserPet> pets;
  int type;
  bool active;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["namevar"] ?? "",
        lastName: json["lastName"] ?? "",
        pets: json["pets"] != null ? List<UserPet>.from(json["pets"].map((x) => UserPet.fromJson(x))) : [],
        secondLastName: json["secondLastName"] ?? "",
        image: json["image"] ?? "",
        password: json["password"] ?? "",
        email: json["email"] ?? "",
        phone: int.parse(json["phone"].toString()),
        documentNumber: json["documentNumber"] ?? "",
        birthDay: DateTime.parse(json["birthDay"]),
        type: json["type"] ?? 1,
        active: json["active"] ?? true,
      );

  Map<String, dynamic> toJson() => {
        "namevar": name ?? "",
        "lastName": lastName ?? "",
        "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
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

class UserPet {
  UserPet({
    this.id,
    this.namevar,
  });

  String id;
  String namevar;

  factory UserPet.fromJson(Map<String, dynamic> json) => UserPet(
        id: json["id"],
        namevar: json["namevar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namevar": namevar,
      };
  Pet get toPet => Pet(id: this.id, namevar: this.namevar);
}
