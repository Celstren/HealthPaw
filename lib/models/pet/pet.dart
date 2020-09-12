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
  List<Stadistic> breathingFrequency = [];
  List<Recommendation> recommendations = [];
  List<Stadistic> heartRate = [];
  List<Stadistic> sound = [];
  List<Stadistic> temperature = [];

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
        breathingFrequency: json["breathingFrequency"] != null ? List<Stadistic>.from(json["breathingFrequency"].map((x) => Stadistic.fromJson(x))) : [],
        heartRate: json["heartRate"] != null ? List<Stadistic>.from(json["heartRate"].map((x) => Stadistic.fromJson(x))) : [],
        sound: json["sound"] != null ? List<Stadistic>.from(json["sound"].map((x) => Stadistic.fromJson(x))) : [],
        temperature: json["temperature"] != null ? List<Stadistic>.from(json["temperature"].map((x) => Stadistic.fromJson(x))) : [],
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

  List<Stadistic> get statsSample => [Stadistic.sample()];
}
