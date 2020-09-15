// To parse this JSON data, do
//
//     final alert = alertFromJson(jsonString);

import 'dart:convert';

Alert alertFromJson(String str) => Alert.fromJson(json.decode(str));

String alertToJson(Alert data) => json.encode(data.toJson());

class Alert {
    Alert({
        this.id,
        this.description,
    });

    String id;
    String description;

    factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        id: json["id"] ?? "",
        description: json["description"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
    };
}
