//import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/config/dioClient.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/views/auth/login/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      if (response.statusCode == 201)
        Preferences.setUser = User.fromJson(response.data);
      return response.statusCode == 201;
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<void> logoutUser(BuildContext context) async {
    try {
      bool success = await Preferences.clear();
      if (success) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginView()), (route) => false);
        return;
      }
    } catch (e) {
      print(e);
    }
    showCustomDialog(context: context, builder: (context) => OkDialog(title: AppStrings.logoutFail, okText: AppStrings.ok, onPress: () => Navigator.pop(context)));
    return ;
  }
}
