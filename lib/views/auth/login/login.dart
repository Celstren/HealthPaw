import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/utils/widgets/global_dialogs.dart';
import 'package:HealthPaw/views/auth/login/widgets/login_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.PrimaryLightBlue));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalDialogs.initContext(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          LoginContent(),
          CommonAppBar(title: AppStrings.login),
        ],
      ),
      backgroundColor: AppColors.PrimaryWhite,
    ));
  }
}
