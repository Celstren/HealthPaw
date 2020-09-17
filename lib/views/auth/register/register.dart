import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/auth/register/widgets/register_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        children: <Widget>[
          RegisterContent(),
          CommonAppBar(title: AppStrings.registerForm),
        ],
      ),
      backgroundColor: AppColors.PrimaryWhite,
    ));
  }
}
