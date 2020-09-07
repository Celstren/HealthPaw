import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:dio/dio.dart';

class PetService {
  static Future<bool> registerPet(Pet pet) async {
    try {
      Response response = await dioClient.post("pet", data: pet.toJson());
      return response != null;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<Pet> getPet(String id) async {
    try {
      Response response = await dioClient.get("pet/" + id);
      Pet pet = Pet.fromJson(response.data);
      return pet;
    } catch (e) {
      print(e);
      return e;
    }
  }

  static Future<bool> updatePet(String id, Pet pet) async {
    try {
      Response response = await dioClient.put("pet/" + id, data: pet.toJson());
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }
}