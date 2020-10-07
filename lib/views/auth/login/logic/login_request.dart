import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';

import 'package:HealthPaw/services/authentication/authentication.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/views/main_menu/main_menu.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginRequest {
  static void verifyUser(BuildContext context, User user) async {
    if ((await Connectivity().checkConnectivity()) != ConnectivityResult.none) {
      Response respuesta = await AuthenticationService.loginUser(user);

      if (respuesta.statusCode == 201) {
        Preferences.clear();
        Preferences.setUser = User.fromJson(respuesta.data);

        showCustomDialog(
          context: context,
          child: CustomDialog(
            backgroundColor: Colors.transparent,
            child: OkDialog(
              title: AppStrings.successfulLogin,
              okText: AppStrings.close,
              onPress: () {
                Navigator.pop(context);
                NavigationMethods.of(context)
                    .navigateReplacement(MainMenuView());
              },
            ),
          ),
        );
      }
    } else {
      showCustomDialog(
        context: context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: OkDialog(
            title: AppStrings.connectionError,
            okText: AppStrings.close,
            onPress: () {
              Navigator.pop(context);
              NavigationMethods.of(context).navigateReplacement(MainMenuView());
            },
          ),
        ),
      );
    }
  }
}
