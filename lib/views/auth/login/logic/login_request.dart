import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/authentication/authentication.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:flutter/material.dart';

class LoginRequest {
  static void verifyUser(BuildContext context, User user) async {
    bool success = await AuthenticationService.loginUser(user);
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
}
