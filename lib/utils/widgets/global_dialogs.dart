import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/loading_screen.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalDialogs {
  static GlobalDialogs _instance;
  static BuildContext _context;

  GlobalDialogs._();

  factory GlobalDialogs() => _getInstance();

  static GlobalDialogs _getInstance() {
    if (_instance == null) {
      _instance = GlobalDialogs._();
    }
    return _instance;
  }

  static initContext(BuildContext context) => _context = context;

  static displayErrorDialog(int statusCode) {
    if (_context != null) {
      showCustomDialog(
        context: _context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: OkDialog(
            height: 150,
            title: _determinarMensajeRespuesta(statusCode),
            okText: AppStrings.close,
            onPress: () => Navigator.pop(_context),
          ),
        ),
      );
    }
  }

  static Future<bool> get displayOnConnectionError async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (_context != null && result == ConnectivityResult.none) {
      showCustomDialog(
        context: _context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: OkDialog(
            height: 150,
            title: AppStrings.connectionError,
            okText: AppStrings.close,
            onPress: () => Navigator.pop(_context),
          ),
        ),
      );
      return true;
    }
    return false;
  }

  static String _determinarMensajeRespuesta(int statusCode) {
    switch (statusCode) {
      case 501: case 500:
        return AppStrings.serviceFailure;
      case 401:
        return AppStrings.nonAuthorized;
      case 201: case 200:
        return AppStrings.successfulLogin;
      default:
        return AppStrings.noConectivity;
    }
  }

  static displayLoading() {
    if (_context != null) {
      displayLoadingScreen(_context);
    }
  }

  static popContext() {
    if (_context != null && Navigator.canPop(_context)) {
      Navigator.pop(_context);
    }
  }
}
