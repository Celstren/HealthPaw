import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:dio/dio.dart';

class AuthenticationService {
  static Future<bool> registerUser(User user) async {
    try {
      Response response = await dioClient.post("user", data: user.toJson());
      return response != null;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> loginUser(User user) async {
    try {
      Response response = await dioClient.post("user/login/", data: {
        "documentNumber": user.documentNumber,
        "password": user.password
      });
      return response.statusCode == 201;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> registerTestUser() async {
    try {
      Response response = await dioClient.post("user", data: {
        "namevar": "Marcos",
        "lastName": "Olivares",
        "secondLastName": "Centello",
        "image": "www.image.com/image.jpg",
        "password": "fsadsafsadgas",
        "email": "test@test.com",
        "phone": 999351872,
        "documentNumber": "732409712",
        "birthDay": "2020-08-07T00:57:50-05:00",
        "type": 1
      });
      return response != null;
    } catch (e) {
      print(e);
    }
    return false;
  }
}
