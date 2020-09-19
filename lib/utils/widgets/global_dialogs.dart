import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/loading_screen.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
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

  static displayConnectionError() {
    if (_context != null) {
      showCustomDialog(
        context: _context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: OkDialog(
            title: AppStrings.connectionFailed,
            okText: AppStrings.close,
            onPress: () => Navigator.pop(_context),
          ),
        ),
      );
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