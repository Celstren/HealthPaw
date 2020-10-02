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
    this.size = "",
    this.weight = 0,
    this.image = "",
    this.birthDay,
    this.petType = "",
    this.alerts,
    this.breathingFrequency,
    this.recommendations,
    this.heartRate,
    this.sound,
    this.temperature,
    this.physicalActivity,
  });

  String id;
  String namevar;
  String breed;
  String size;
  num weight;
  String image;
  DateTime birthDay;
  String petType;
  List<Alert> alerts = [];
  Stadistic breathingFrequency;
  List<Recommendation> recommendations = [];
  Stadistic heartRate;
  Stadistic sound;
  Stadistic temperature;
  Stadistic physicalActivity;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        id: json["id"] ?? "",
        namevar: json["namevar"] ?? "",
        breed: json["breed"] ?? "",
        size: json["size"] is String ? (json["size"] ?? "") : json["size"]?.toString() ?? "",
        weight: json["weight"] ?? 0,
        image: json["image"] ?? "",
        birthDay: DateTime.tryParse(json["birthDay"]),
        petType: json["petType"] ?? "",
        alerts: json["alerts"] != null && json["alerts"] is List
            ? json["alerts"].map<Alert>((e) => Alert.fromJson(e)).toList()
            : null,
        breathingFrequency: json["breathingFrequency"] != null &&
                json["breathingFrequency"] is Map
            ? Stadistic.fromJson(json["breathingFrequency"])
            : null,
        heartRate: json["heartRate"] != null && json["heartRate"] is Map
            ? Stadistic.fromJson(json["heartRate"])
            : null,
        sound: json["sound"] != null && json["sound"] is Map
            ? Stadistic.fromJson(json["sound"])
            : null,
        temperature: json["temperature"] != null && json["temperature"] is Map
            ? Stadistic.fromJson(json["temperature"])
            : null,
        physicalActivity: json["temperature"] != null && json["temperature"] is Map
            ? Stadistic.fromJson(json["temperature"])
            : null,
        recommendations:
            json["recommendations"] != null && json["recommendations"] is List
                ? json["recommendations"]
                    .map<Recommendation>((e) => Recommendation.fromJson(e))
                    .toList()
                : null,
      );

  Map<String, dynamic> toJson() => {
        "namevar": namevar ?? "",
        "breed": breed ?? "",
        "size": size ?? "",
        "weight": weight ?? 0,
        "image": image ?? "",
        "birthDay": birthDay?.toIso8601String() ?? "",
        "petType": petType ?? "",
        "recommendations": recommendations ?? [],
        "alerts": alerts ?? [],
        "breathingFrequency": breathingFrequency ?? Stadistic().toJson(),
        "heartRate": heartRate ?? Stadistic().toJson(),
        "sound": sound ?? Stadistic().toJson(),
        "temperature": temperature ?? Stadistic().toJson(),
        "physicalActivity": physicalActivity ?? Stadistic().toJson(),
      };
}
