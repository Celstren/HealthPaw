import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/text_field_container.dart';
import 'package:HealthPaw/views/auth/login/widgets/login_logo.dart';
import 'package:HealthPaw/views/environment_temperature/environment_temperature.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  LoginContent({Key key}) : super(key: key);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 160),
            LoginLogo(),
            SizedBox(height: 60),
            TextFieldContainer(
              controller: usernameController,
              backgroundColor: AppColors.PrimaryLightBlue,
              leftLabel: "${AppStrings.user}:",
              leftLabelStyle: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
              leftLabelWidth: 120,
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
              borderRadius: AppBorderRadius.all(radius: AppRadius.radius30),
            ),
            SizedBox(height: 40),
            TextFieldContainer(
              controller: passwordController,
              backgroundColor: AppColors.PrimaryLightBlue,
              leftLabel: "${AppStrings.password}:",
              leftLabelStyle: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
              leftLabelWidth: 120,
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
              borderRadius: AppBorderRadius.all(radius: AppRadius.radius30),
            ),
            SizedBox(height: 50),
            RoundedButton(
              text: AppStrings.login,
              size: Size(200, 50),
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
              onPress: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EnvironmentTemperatureView())),
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  AppStrings.termsConditionsLabel,
                  style: AppTextStyle.blackStyle(fontSize: AppFontSizes.text12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
