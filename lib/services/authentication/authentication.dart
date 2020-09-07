import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:dio/dio.dart';

class AuthenticationService {

  static Future<bool> registerUser(User user) async {
    try {
      Response response = await dioClient.post("user", data: user.toJson());
      return response != null && response.statusCode == 200;
    } catch (e) {
      print(e);
    }
    return false;
  }

}