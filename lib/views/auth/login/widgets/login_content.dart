import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/loading_screen.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/text_field_container.dart';
import 'package:HealthPaw/views/auth/login/logic/login_form.dart';
import 'package:HealthPaw/views/auth/login/logic/login_request.dart';
import 'package:HealthPaw/views/auth/login/widgets/login_logo.dart';
import 'package:HealthPaw/views/auth/register/register.dart';
import 'package:HealthPaw/views/main_menu/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginContent extends StatefulWidget {
  LoginContent({Key key}) : super(key: key);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  LoginForm _loginForm = LoginForm();

  void _submit() async {
    if (_loginForm.validForm) {
      displayLoadingScreen(context);
      LoginRequest.verifyUser(context, _loginForm.result);
    } else {
      setState(() {
        _loginForm.validateValues();
      });
    }
  }

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
            _registerTextField(
                controller: _loginForm.documentNumberController,
                title: "${AppStrings.user}",
                hint: AppStrings.enterUsername,
                errorMsg:
                    "${AppStrings.theField} ${AppStrings.user} ${AppStrings.isInvalid}",
                isValid: _loginForm.validDocumentNumber,
                onChanged: (value) {
                  if (!_loginForm.validDocumentNumber) {
                    setState(() {
                      _loginForm.validDocumentNumberValue = true;
                    });
                  }
                }),
            SizedBox(height: 40),
            _registerTextField(
                controller: _loginForm.passwordController,
                title: "${AppStrings.password}",
                hint: AppStrings.enterPassword,
                errorMsg:
                    "${AppStrings.theField} ${AppStrings.password} ${AppStrings.isInvalid}",
                isValid: _loginForm.validPassword,
                onChanged: (value) {
                  if (!_loginForm.validPassword) {
                    setState(() {
                      _loginForm.validPasswordValue = true;
                    });
                  }
                }),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  text: AppStrings.login,
                  size: Size(160, 50),
                  style:
                      AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                  onPress: _submit,
                  // onPress: () => Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (context) => MainMenuView())),
                ),
                RoundedButton(
                  text: AppStrings.register,
                  size: Size(160, 50),
                  style:
                      AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                  onPress: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterView())),
                ),
              ],
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

  Widget _registerTextField(
      {TextEditingController controller,
      String title = "",
      String hint = "",
      String errorMsg = "",
      bool isValid = true,
      bool isPasswordConfirmation = false,
      List<TextInputFormatter> inputFormatters,
      bool obscureText = false,
      Widget suffixIcon,
      Function(String) onChanged}) {
    Widget _validationSection = SizedBox();

    if (!isValid) {
      _validationSection = Text(errorMsg,
          style: AppTextStyle.redStyle(fontSize: AppFontSizes.text12));
    }

    return Column(children: <Widget>[
      TextFieldContainer(
        controller: controller,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        onSubmitted: (value) => _submit(),
        obscureText: obscureText,
        backgroundColor: AppColors.PrimaryLightBlue,
        hint: hint,
        hintStyle: AppTextStyle.blackStyle(fontSize: AppFontSizes.subitle16),
        style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius30),
        suffixIcon: suffixIcon,
        leftLabel: "${title}:",
        leftLabelStyle: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
        leftLabelWidth: 120,
      ),
      _validationSection,
    ]);
  }
}
