// To parse this JSON data, do
//
//     final recommendation = recommendationFromJson(jsonString);

import 'dart:convert';

Recommendation recommendationFromJson(String str) => Recommendation.fromJson(json.decode(str));

String recommendationToJson(Recommendation data) => json.encode(data.toJson());

class Recommendation {
    Recommendation({
        this.id,
        this.description,
        this.date,
    });

    String id;
    String description;
    DateTime date;

    factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
        id: json["id"] ?? "",
        description: json["description"] ?? "",
        date: DateTime.tryParse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "date": date?.toIso8601String() ?? "",
    };
}
