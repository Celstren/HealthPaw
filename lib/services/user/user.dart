import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:dio/dio.dart';

class UserService {
  static Future<User> getUser(String id) async {
    try {
      Response response = await dioClient.get("user/" + id);
      User user = User.fromJson(response.data);
      return user;
    } catch (e) {
      print(e);
      return e;
    }
  }

  static Future<bool> updateUser(String id, User user) async {
    try {
      Response response =
          await dioClient.put("user/" + id, data: user.toJson());
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> updateDynamic(
      String id, Map<String, dynamic> data) async {
    try {
      Response response = await dioClient.put("user/" + id, data: data);
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> addPetToUser(
      String id, String petName, String petId) async {
    try {
      Response response = await dioClient
          .put("user/" + id + "/addPet", data: {"namevar": petName, "id": petId});
      if (response.statusCode == 200) {
        Preferences.setUser = User.fromJson(response.data);
      }
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> editPetToUser(
      String id, String petName, String petId) async {
    try {
      Response response = await dioClient
          .put("user/" + id + "/editPet", data: {"namevar": petName, "id": petId});
      if (response.statusCode == 200) {
        Preferences.setUser = User.fromJson(response.data);
      }
      return response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<void> get updateUserLocalData async {
    try {
      Response response = await dioClient.get("user/" + Preferences.getUser.documentNumber);
      Preferences.setUser = User.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}
