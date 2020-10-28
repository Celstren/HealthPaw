import 'package:HealthPaw/models/globalNotification/globalNotification.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:dio/dio.dart';

class GlobalNotificationService {
  static Future<bool> registerGlobalNotification(GlobalNotification globalNotification) async {
    try {
      Response response = await dioClient.post("global-notification", data: globalNotification.toJson());
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      print(e);
      return false;
    }
  }
}