import 'dart:convert';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/user/user.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/helpers/validators.dart';
import 'package:HealthPaw/utils/widgets/app_text_field.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ModifyOwnerProfileContent extends StatefulWidget {
  ModifyOwnerProfileContent({Key key}) : super(key: key);

  @override
  _ModifyOwnerProfileContentState createState() =>
      _ModifyOwnerProfileContentState();
}

class _ModifyOwnerProfileContentState extends State<ModifyOwnerProfileContent> {
  String name = "";
  String documentNumber = "";
  String secondLastName = "";
  String lastName = "";
  String email = "";
  String phone = "";
  String dayofRegistration = "";
  String birthDay = "";
  String namevar = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool validEmail = true, validMobile = true;

  bool get validatedEmail =>
      Validators.validEmail(emailController.value.text.trim());
  bool get validatedMobile =>
      Validators.validNumber(phoneController.value.text.trim());

  void _submit() async {
    if (validatedEmail && validatedMobile) {
      if (await modifyRequest()) showModifySuccessDialog();
    } else {
      setState(() {
        validEmail = validatedEmail;
        validMobile = validatedMobile;
      });
    }
  }

  Future<bool> modifyRequest() async {
    this.email = emailController.value.text.trim();
    this.phone = phoneController.value.text.trim();
    bool res = await UserService.updateDynamic(
        documentNumber, {"email": email, "phone": phone});
    return res;
  }

  void getData() async {
    User user =
        await UserService.getUser(Preferences.getUser.documentNumber);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(user.birthDay);
    setState(() {
      birthDay = formatted;
      name = user.name;
      lastName = user.lastName;
      secondLastName = user.lastName;
      email = user.email;
      documentNumber = user.documentNumber;
      phone = user.phone.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void showModifySuccessDialog() {
    showCustomDialog(
      context: context,
      child: CustomDialog(
        backgroundColor: Colors.transparent,
        child: OkDialog(
          title: AppStrings.successfulModify,
          okText: AppStrings.close,
          onPress: () => Navigator.pop(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      _buildOverviewField(label: AppStrings.names, text: name),
                      SizedBox(height: 10),
                      _buildOverviewField(
                          label: AppStrings.lastnames,
                          text: lastName + secondLastName),
                      SizedBox(height: 10),
                      AppSimpleTextField(
                          title: AppStrings.mobileNumber,
                          controller: phoneController,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          hint: AppStrings.enterMobile,
                          size: Size(160, 40),
                          errorMsg:
                              "${AppStrings.theField} ${AppStrings.mobileNumber} ${AppStrings.isInvalid}",
                          isValid: validMobile,
                          onChanged: (value) {
                            if (!validMobile) {
                              setState(() {
                                validMobile = true;
                              });
                            }
                          }),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                        width: 90,
                        child: Placeholder(),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildOverviewField(label: AppStrings.birthDay, text: birthDay),
              SizedBox(height: 10),
              AppSimpleTextField(
                  title: AppStrings.email,
                  controller: emailController,
                  hint: AppStrings.enterEmail,
                  errorMsg:
                      "${AppStrings.theField} ${AppStrings.email} ${AppStrings.isInvalid}",
                  isValid: validEmail,
                  onChanged: (value) {
                    if (!validEmail) {
                      setState(() {
                        validEmail = true;
                      });
                    }
                  }),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundedButton(
                    text: AppStrings.modify,
                    size: Size(150, 40),
                    style:
                        AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                    onPress: () => _submit(),
                  ),
                  RoundedButton(
                    text: AppStrings.cancel,
                    size: Size(150, 40),
                    style:
                        AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                    onPress: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewField({String label = "", String text = ""}) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            child: Text(
              "$label:",
              style: AppTextStyle.blackStyle(
                fontSize: AppFontSizes.subitle18,
                fontFamily: AppFonts.Montserrat_Bold,
              ),
            ),
          ),
          SizedBox(
            child: Text(
              "\t$text",
              style: AppTextStyle.blackStyle(
                fontSize: AppFontSizes.subitle18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
