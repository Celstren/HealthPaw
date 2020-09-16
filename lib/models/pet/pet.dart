import 'dart:convert';

import 'package:HealthPaw/models/pet/alert.dart';
import 'package:HealthPaw/models/pet/recommendation.dart';
import 'package:HealthPaw/models/pet/stadistic.dart';

Pet petFromJson(String str) => Pet.fromJson(json.decode(str));

String petToJson(Pet data) => json.encode(data.toJson());

class Pet {
  Pet({
    this.id = "",
    this.namevar = "",
    this.breed = "",
    this.size = 0,
    this.weigth = 0,
    this.image = "",
    this.birthDay,
    this.petType = "",
    this.alerts,
    this.breathingFrequency,
    this.recommendations,
    this.heartRate,
    this.sound,
    this.temperature,
  });

  String id;
  String namevar;
  String breed;
  num size;
  num weigth;
  String image;
  DateTime birthDay;
  String petType;
  List<Alert> alerts = [];
  Stadistic breathingFrequency;
  List<Recommendation> recommendations = [];
  Stadistic heartRate;
  Stadistic sound;
  Stadistic temperature;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"] ?? "",
        namevar: json["namevar"] ?? "",
        breed: json["breed"] ?? "",
        size: json["size"] ?? 0,
        weigth: json["weigth"] ?? 0,
        image: json["image"] ?? "",
        birthDay: DateTime.tryParse(json["birthDay"]),
        petType: json["petType"] ?? "",
        alerts: json["alerts"] ?? "",
        breathingFrequency: json["breathingFrequency"] != null ? Stadistic.fromJson(json["breathingFrequency"]) : [],
        heartRate: json["heartRate"] != null ? Stadistic.fromJson(json["heartRate"]) : [],
        sound: json["sound"] != null ? Stadistic.fromJson(json["sound"]) : [],
        temperature: json["temperature"] != null ? Stadistic.fromJson(json["temperature"]) : [],
        recommendations: json["recommendations"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "namevar": namevar ?? "",
        "breed": breed ?? "",
        "size": size ?? 0,
        "weigth": weigth ?? 0,
        "image": image ?? "",
        "birthDay": birthDay?.toIso8601String() ?? "",
        "petType": petType ?? "",
      };
}
