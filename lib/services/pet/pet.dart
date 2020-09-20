import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:dio/dio.dart';

class PetService {
  static Future<String> registerPet(Pet pet) async {
    try {
      Response response = await dioClient.post("pet", data: pet.toJson());
      if (response.statusCode == 201) {
        return response.data["id"];
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<Pet>> listPets() async {
    try {
      Response response = await dioClient.get("pet");
      List<Pet> pets = response.data.map<Pet>((e) => Pet.fromJson(e)).toList();
      return pets;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Pet> getPet(String id) async {
    try {
      Response response = await dioClient.get("pet/" + id);
      Pet pet = Pet.fromJson(response.data);
      return pet;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<bool> updatePet(Pet pet) async {
    try {
      Response response = await dioClient.put("pet/" + pet.id, data: pet.toJson());
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> reportStatus(String id, num breathFrecuency, num cardiacFrequency) async {
    try {
      Response response = await dioClient.put("pet/stadistics/$id", data: {
        "breathingFrequency": breathFrecuency,
        "heartRate": cardiacFrequency,
      });
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
