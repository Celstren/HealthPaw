import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/views/auth/login_web/widgets/login_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginWebView extends StatefulWidget {
  LoginWebView({Key key}) : super(key: key);

  @override
  _LoginWebViewState createState() => _LoginWebViewState();
}

class _LoginWebViewState extends State<LoginWebView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.PrimaryLightBlue));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[LoginContent()],
      ),
      backgroundColor: AppColors.PrimaryWhite,
    ));
  }
}
