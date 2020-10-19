import 'package:HealthPaw/models/firebaseuser/firebaseuser.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:dio/dio.dart';

class FirebaseService {
  static Future<bool> registerKey(FirebaseUser firebaseUser) async {
    try {
      Response response = await dioClient.post("firebaseuser", data: firebaseUser.toJson());
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      print(e);
      return null;
    }
  }
}