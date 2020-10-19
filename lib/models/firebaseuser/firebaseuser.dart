// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

FirebaseUser userFromJson(String str) => FirebaseUser.fromJson(json.decode(str));

String userToJson(FirebaseUser data) => json.encode(data.toJson());

class FirebaseUser {
  FirebaseUser(
      {this.userdocument,
      this.firebaseKey,
      });

  String userdocument;
  String firebaseKey;

  factory FirebaseUser.fromJson(Map<String, dynamic> json) => FirebaseUser(
        userdocument: json["userdocument"] ?? "",
        firebaseKey: json["firebaseKey"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "userdocument": userdocument ?? "",
        "firebaseKey": firebaseKey ?? "",
      };
}