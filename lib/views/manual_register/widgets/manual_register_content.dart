import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/helpers/validators.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/text_field_container.dart';
import 'package:HealthPaw/views/auth/register/logic/register_form.dart';
import 'package:HealthPaw/views/manual_register/logic/manual_register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ManualRegisterContent extends StatefulWidget {
  final UserType userType;
  ManualRegisterContent({Key key, this.userType = UserType.Owner})
      : super(key: key);

  @override
  _ManualRegisterContentState createState() => _ManualRegisterContentState();
}

class _ManualRegisterContentState extends State<ManualRegisterContent> {
  RegisterForm _manualRegisterForm = RegisterForm();
  bool passwordsMatchs = false;
  bool obscurePassword1 = true;
  bool obscurePassword2 = true;

  void _submit() async {
    if (_manualRegisterForm.validForm) {
      ManualRegisterRequest.createUserRequest(
          context, _manualRegisterForm.result);
    } else {
      setState(() {
        _manualRegisterForm.validateValues();
      });
    }
  }

  @override
  void initState() {
    switch (widget.userType) {
      case UserType.Owner:
        _manualRegisterForm.userTypeController =
            ConstantHelper.USER_TYPE_OWNER_ID;
        break;
      case UserType.Vet:
        _manualRegisterForm.userTypeController =
            ConstantHelper.USER_TYPE_VET_ID;
        break;
      case UserType.Admin:
        _manualRegisterForm.userTypeController =
            ConstantHelper.USER_TYPE_ADMIN_ID;
        break;
      case UserType.Admin:
        _manualRegisterForm.userTypeController = ConstantHelper.USER_TYPE_ADMIN_ID;
        break;
    }
    super.initState();
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
              controller: _manualRegisterForm.nameController,
              title: "${AppStrings.names}:",
              hint: AppStrings.enterName,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.names} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validNameValue,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
                // FilteringTextInputFormatter.deny(Validators.numberRegex)
                BlacklistingTextInputFormatter(Validators.numberRegex)
              ],
              onChanged: (value) {
                if (!_manualRegisterForm.validNameValue) {
                  setState(() {
                    _manualRegisterForm.validNameValue = true;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _manualRegisterForm.lastnameController,
              title: "${AppStrings.lastnames}:",
              hint: AppStrings.enterLastname,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.lastnames} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validLastnameValue,
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
                // FilteringTextInputFormatter.deny(Validators.numberRegex)
                BlacklistingTextInputFormatter(Validators.numberRegex)
              ],
              onChanged: (value) {
                if (!_manualRegisterForm.validLastnameValue) {
                  setState(() {
                    _manualRegisterForm.validLastnameValue = true;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _manualRegisterForm.usernameController,
              title: "${AppStrings.username}:",
              hint: AppStrings.enterUsername,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.username} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validUsernameValue,
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              onChanged: (value) {
                if (!_manualRegisterForm.validUsernameValue) {
                  setState(() {
                    _manualRegisterForm.validUsernameValue = true;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _manualRegisterForm.documentNumberController,
              title: "${AppStrings.documentNumber}:",
              hint: AppStrings.enterDocumentNumber,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.documentNumber} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validDocumentNumberValue,
              onChanged: (value) {
                if (!_manualRegisterForm.validDocumentNumberValue) {
                  setState(() {
                    _manualRegisterForm.validDocumentNumberValue = true;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _manualRegisterForm.passwordController,
              title: "${AppStrings.password}:",
              hint: AppStrings.enterPassword,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.password} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validPasswordValue,
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
                if (!_manualRegisterForm.validPasswordValue) {
                  setState(() {
                    _manualRegisterForm.validPasswordValue = true;
                  });
                }
              },
            ),
            SizedBox(
              width: 375,
              child: Text(
                AppStrings.passwordConstraints,
                style: _manualRegisterForm.validPasswordValue
                    ? AppTextStyle.blackStyle(fontSize: AppFontSizes.text12)
                    : AppTextStyle.redStyle(fontSize: AppFontSizes.text12),
              ),
            ),
            separation,
            _registerTextField(
              controller: _manualRegisterForm.password2Controller,
              title: "${AppStrings.password2}:",
              hint: AppStrings.enterPassword,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.password2} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validPassword2Value,
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
                if (!_manualRegisterForm.validPassword2) {
                  setState(() {
                    _manualRegisterForm.validPassword2Value = true;
                    passwordsMatchs = false;
                  });
                }
              },
            ),
            separation,
            _registerTextField(
              controller: _manualRegisterForm.mobileController,
              title: "${AppStrings.mobileNumber}:",
              hint: AppStrings.enterMobile,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.mobileNumber} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validMobileValue,
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
                // FilteringTextInputFormatter.digitsOnly,
                WhitelistingTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                if (!_manualRegisterForm.validMobileValue) {
                  setState(() {
                    _manualRegisterForm.validMobileValue = true;
                  });
                }
              },
            ),
            separation,
            _registerDateField(
              controller: _manualRegisterForm.dateController,
              title: "${AppStrings.birthDay}:",
              isValid: _manualRegisterForm.validDateValue,
            ),
            separation,
            _registerTextField(
              controller: _manualRegisterForm.emailController,
              title: "${AppStrings.email}:",
              hint: AppStrings.enterEmail,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.email} ${AppStrings.isInvalid}",
              isValid: _manualRegisterForm.validEmailValue,
              onChanged: (value) {
                if (!_manualRegisterForm.validEmailValue) {
                  setState(() {
                    _manualRegisterForm.validEmailValue = true;
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
                  size: Size(160, 50),
                  style:
                      AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                  onPress: _submit,
                ),
                RoundedButton(
                  text: AppStrings.cancel,
                  size: Size(160, 50),
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
                  _manualRegisterForm.dateController = dateSelected;
                  _manualRegisterForm.validDateValue =
                      _manualRegisterForm.validDate;
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
      if (isPasswordConfirmation && _manualRegisterForm.validPassword2) {
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
