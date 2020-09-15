import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/services/authentication/authentication.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/views/main_menu/main_menu.dart';
import 'package:flutter/material.dart';

class LoginRequest {
  static void verifyUser(BuildContext context, User user) async {
    RespuestasLogin respuesta = await AuthenticationService.loginUser(user);
    Navigator.pop(context);
    if (respuesta == RespuestasLogin.okay) {
      showCustomDialog(
        context: context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: OkDialog(
            title: AppStrings.successfulLogin,
            okText: AppStrings.close,
            onPress: () {
              Navigator.pop(context);
              NavigationMethods.of(context).navigateReplacement(MainMenuView());
            },
          ),
        ),
      );
    } else {
      showCustomDialog(
        context: context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: OkDialog(
            title: DeterminarMensajeRespuesta(respuesta),
            okText: AppStrings.close,
            onPress: () => Navigator.pop(context),
          ),
        ),
      );
    }
  }

  static String DeterminarMensajeRespuesta(RespuestasLogin respuesta){
    switch(respuesta){
      case RespuestasLogin.SinConexion:
        return AppStrings.noConectivity;
      case RespuestasLogin.ErrorServicio:
        return AppStrings.serviceFailure;
      case RespuestasLogin.NoAutorizado:
        return AppStrings.nonAuthorized;
      default:
        return AppStrings.serviceFailure;
    }
  }


}
