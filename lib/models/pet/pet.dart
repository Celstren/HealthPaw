import 'dart:convert';

Pet petFromJson(String str) => Pet.fromJson(json.decode(str));

String petToJson(Pet data) => json.encode(data.toJson());

class Pet {
  Pet({
    this.namevar,
    this.breed,
    this.size,
    this.weigth,
    this.image,
    this.birthDay,
    this.petType,
  });

  String namevar;
  String breed;
  int size;
  int weigth;
  String image;
  DateTime birthDay;
  String petType;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
        namevar: json["namevar"] ?? "",
        breed: json["breed"] ?? "",
        size: json["size"] ?? 0,
        weigth: json["weigth"] ?? 0,
        image: json["image"] ?? "",
        birthDay: DateTime.tryParse(json["birthDay"]),
        petType: json["petType"] ?? "",
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
