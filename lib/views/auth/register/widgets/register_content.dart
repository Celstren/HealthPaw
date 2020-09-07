import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/services/authentication/authentication.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/text_field_container.dart';
import 'package:HealthPaw/views/auth/register/logic/register_form.dart';
import 'package:HealthPaw/views/auth/register/logic/register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RegisterContent extends StatefulWidget {
  RegisterContent({Key key}) : super(key: key);

  @override
  _RegisterContentState createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  RegisterForm _registerForm = RegisterForm();
  bool passwordsMatchs = false;
  bool obscurePassword1 = true;
  bool obscurePassword2 = true;

  void _submit() async {
    if (_registerForm.validForm) {
      RegisterRequest.createUserRequest(context, _registerForm.result);
    } else {
      setState(() {
        _registerForm.validateValues();
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
            _registerTextField(
              controller: _registerForm.nameController,
              title: "${AppStrings.names}:",
              hint: AppStrings.enterName,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.names} ${AppStrings.isInvalid}",
              isValid: _registerForm.validNameValue,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              onChanged: (value) {
                if (!_registerForm.validNameValue) {
                  setState(() {
                    _registerForm.validNameValue = true;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _registerForm.lastnameController,
              title: "${AppStrings.lastnames}:",
              hint: AppStrings.enterLastname,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.lastnames} ${AppStrings.isInvalid}",
              isValid: _registerForm.validLastnameValue,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              onChanged: (value) {
                if (!_registerForm.validLastnameValue) {
                  setState(() {
                    _registerForm.validLastnameValue = true;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _registerForm.usernameController,
              title: "${AppStrings.username}:",
              hint: AppStrings.enterUsername,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.username} ${AppStrings.isInvalid}",
              isValid: _registerForm.validUsernameValue,
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              onChanged: (value) {
                if (!_registerForm.validUsernameValue) {
                  setState(() {
                    _registerForm.validUsernameValue = true;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _registerForm.passwordController,
              title: "${AppStrings.password}:",
              hint: AppStrings.enterPassword,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.password} ${AppStrings.isInvalid}",
              isValid: _registerForm.validPasswordValue,
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              obscureText: obscurePassword1,
              suffixIcon: SizedBox(
                height: 40,
                width: 40,
                child: GestureDetector(
                  child: Icon(
                      obscurePassword1
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 30,
                      color: AppColors.PrimaryBlack),
                  onTap: () {
                    setState(() {
                      obscurePassword1 = !obscurePassword1;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                if (!_registerForm.validPasswordValue) {
                  setState(() {
                    _registerForm.validPasswordValue = true;
                  });
                }
              },
            ),
            SizedBox(
              width: 375,
              child: Text(
                AppStrings.passwordConstraints,
                style: _registerForm.validPasswordValue
                    ? AppTextStyle.blackStyle(fontSize: AppFontSizes.text12)
                    : AppTextStyle.redStyle(fontSize: AppFontSizes.text12),
              ),
            ),
            separation,
            _registerTextField(
              controller: _registerForm.password2Controller,
              title: "${AppStrings.password2}:",
              hint: AppStrings.enterPassword,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.password2} ${AppStrings.isInvalid}",
              isValid: _registerForm.validPassword2Value,
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              obscureText: obscurePassword2,
              suffixIcon: SizedBox(
                height: 40,
                width: 40,
                child: GestureDetector(
                  child: Icon(
                      obscurePassword2
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 30,
                      color: AppColors.PrimaryBlack),
                  onTap: () {
                    setState(() {
                      obscurePassword2 = !obscurePassword2;
                    });
                  },
                ),
              ),
              isPasswordConfirmation: true,
              onChanged: (value) {
                if (!_registerForm.validPassword2) {
                  setState(() {
                    _registerForm.validPassword2Value = true;
                    passwordsMatchs = false;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _registerForm.mobileController,
              title: "${AppStrings.mobileNumber}:",
              hint: AppStrings.enterMobile,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.mobileNumber} ${AppStrings.isInvalid}",
              isValid: _registerForm.validMobileValue,
              inputFormatters: [LengthLimitingTextInputFormatter(9)],
              onChanged: (value) {
                if (!_registerForm.validMobileValue) {
                  setState(() {
                    _registerForm.validMobileValue = true;
                  });
                }
              },
            ),
            separation,
            _registerDateField(
              controller: _registerForm.dateController,
              title: "${AppStrings.birthDay}:",
              isValid: _registerForm.validDateValue,
            ),
            separation,
            _registerTextField(
              controller: _registerForm.emailController,
              title: "${AppStrings.email}:",
              hint: AppStrings.enterEmail,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.email} ${AppStrings.isInvalid}",
              isValid: _registerForm.validEmailValue,
              onChanged: (value) {
                if (!_registerForm.validEmailValue) {
                  setState(() {
                    _registerForm.validEmailValue = true;
                  });
                }
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  text: AppStrings.register,
                  size: Size(200, 50),
                  style:
                      AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                  onPress: _submit,
                ),
                RoundedButton(
                  text: AppStrings.cancel,
                  size: Size(200, 50),
                  style:
                      AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                  onPress: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  SizedBox get separation => SizedBox(height: 20);

  Widget _registerDateField(
      {DateTime controller, String title = "", bool isValid = true}) {
    return SizedBox(
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: AppTextStyle.blackStyle(fontSize: AppFontSizes.subitle16)),
          GestureDetector(
            onTap: () async {
              DateTime dateSelected = await showDatePicker(
                  context: context,
                  initialDate: controller ?? DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 100),
                  lastDate: DateTime.now());
              if (dateSelected != null) {
                setState(() {
                  _registerForm.dateController = dateSelected;
                  _registerForm.validDateValue = _registerForm.validDate;
                });
              }
            },
            child: Container(
              width: 375,
              height: 40,
              decoration: BoxDecoration(
                border: AppBorder.blackBorder,
                borderRadius: AppBorderRadius.all(radius: AppRadius.radius5),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                      controller != null
                          ? DateFormat("dd/MM/yyyy").format(controller)
                          : AppStrings.enterBirthday,
                      style: AppTextStyle.blackStyle(
                          fontSize: AppFontSizes.subitle16)),
                ),
              ),
            ),
          ),
          isValid
              ? SizedBox()
              : Text(
                  "${AppStrings.theField} ${AppStrings.birthDay} ${AppStrings.isInvalid}",
                  style: AppTextStyle.redStyle(fontSize: AppFontSizes.text12)),
        ],
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
    } else {
      if (isPasswordConfirmation && _registerForm.validPassword2) {
        _validationSection = Text(AppStrings.passwordsMatch,
            style: AppTextStyle.greenStyle(fontSize: AppFontSizes.text12));
      }
    }

    return SizedBox(
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              maxLines: null,
              style: AppTextStyle.blackStyle(fontSize: AppFontSizes.subitle16)),
          TextFieldContainer(
            size: Size(375, 40),
            controller: controller,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onSubmitted: (value) => _submit(),
            obscureText: obscureText,
            backgroundColor: AppColors.PrimaryWhite,
            hint: hint,
            hintStyle:
                AppTextStyle.blackStyle(fontSize: AppFontSizes.subitle16),
            style: AppTextStyle.blackStyle(fontSize: AppFontSizes.subitle16),
            borderRadius: AppBorderRadius.all(radius: AppRadius.radius5),
            border: AppBorder.blackBorder,
            collapsed: true,
            suffixIcon: suffixIcon,
          ),
          _validationSection,
        ],
      ),
    );
  }
}
