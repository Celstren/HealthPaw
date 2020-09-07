import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/authentication/authentication.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:flutter/material.dart';

class RegisterRequest {
  static void createUserRequest(BuildContext context, User user) async {
    bool success =
          await AuthenticationService.registerUser(user);
    Navigator.pop(context);
      if (success) {
        showCustomDialog(
          context: context,
          child: CustomDialog(
            backgroundColor: Colors.transparent,
            child: OkDialog(
              title: AppStrings.successfulRegister,
              okText: AppStrings.close,
              onPress: () => Navigator.pop(context),
            ),
          ),
        );
      } else {
        showCustomDialog(
          context: context,
          child: CustomDialog(
            backgroundColor: Colors.transparent,
            child: OkDialog(
              title: AppStrings.failedRegister,
              okText: AppStrings.close,
              onPress: () => Navigator.pop(context),
            ),
          ),
        );
      }
  }
  
  static void createTestUserRequest(BuildContext context, User user) async {
    bool success =
          await AuthenticationService.registerTestUser();
      if (success) {
        showCustomDialog(
          context: context,
          child: CustomDialog(
            backgroundColor: Colors.transparent,
            child: OkDialog(
              title: AppStrings.successfulRegister,
              okText: AppStrings.close,
              onPress: () {},
            ),
          ),
        );
      } else {
        showCustomDialog(
          context: context,
          child: CustomDialog(
            backgroundColor: Colors.transparent,
            child: OkDialog(
              title: AppStrings.failedRegister,
              okText: AppStrings.close,
              onPress: () {},
            ),
          ),
        );
      }
  }
}