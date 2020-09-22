import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/services/user/user.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/views/main_menu/main_menu.dart';
import 'package:flutter/material.dart';

class ManualRegisterRequest {
  static void createUserRequest(BuildContext context, User user) async {
    bool success =
          await UserService.addUser(user);
      if (success) {
        showCustomDialog(
          context: context,
          barrierDismissible: false,
          child: CustomDialog(
            backgroundColor: Colors.transparent,
            child: OkDialog(
              dismissible: false,
              title: AppStrings.successfulRegister,
              okText: AppStrings.close,
              onPress: () {
                /*Navigator.pop(context);
                Navigator.pop(context);*/
                NavigationMethods.of(context).navigateAndRemoveUntil(MainMenuView());
              },
            ),
          ),
        );
      }
  }
}