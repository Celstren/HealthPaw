import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/services/user/user.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/two_options_dialog.dart';
import 'package:HealthPaw/views/modify_owner_profile/modify_owner_profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VetProfileContent extends StatefulWidget {
  VetProfileContent({Key key}) : super(key: key);

  @override
  _VetProfileContentState createState() => _VetProfileContentState();
}

class _VetProfileContentState extends State<VetProfileContent> {
  String name = "";
  String documentNumber = "";
  String secondLastName = "";
  String lastName = "";
  String email = "";
  String phone = "";
  String dayofRegistration = "";
  String birthDay = "";
  String namevar = "";

  void showAskDeactivateAccountDialog() {
    showCustomDialog(
      context: context,
      child: CustomDialog(
        backgroundColor: Colors.transparent,
        child: TwoOptionsDialog(
          title: AppStrings.askDeactivateAccount,
          leftOptionText: AppStrings.accept,
          rightOptionText: AppStrings.close,
          onLeftPress: () async {
            if (await deactivateRequest()) showDeactivateSuccessDialog();
          },
          onRightPress: () => Navigator.pop(context),
        ),
      ),
    );
  }

  void showDeactivateSuccessDialog() {
    showCustomDialog(
      context: context,
      child: CustomDialog(
        backgroundColor: Colors.transparent,
        child: OkDialog(
          title: AppStrings.successfulDeactivate,
          okText: AppStrings.close,
          onPress: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Future<bool> deactivateRequest() async {
    bool res = await UserService.updateDynamic(
        Preferences.getUser.documentNumber, {"active": false});
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 10.0, right: 5.0),
        width: MediaQuery.of(context).size.width,
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
                    _buildOverviewField(
                        label: AppStrings.mobileNumber, text: phone),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(                     
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,                          
                          border: Border.all(color: AppColors.PrimaryLightBlue, width: 1.0),
                          image: DecorationImage(
                            image: AssetImage('assets/icons/vet.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RoundedButton(
                      size: Size(130, 30),
                      text: AppStrings.deactivateUser,
                      style: AppTextStyle.whiteStyle(
                          fontSize: AppFontSizes.text10,
                          fontWeight: FontWeight.bold),
                      onPress: showAskDeactivateAccountDialog,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            _buildOverviewField(label: AppStrings.birthDay, text: birthDay),
            SizedBox(height: 10),
            _buildOverviewField(label: AppStrings.email, text: email),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RoundedButton(
                  text: AppStrings.modify,
                  size: Size(150, 40),
                  style:
                      AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                  onPress: () => NavigationMethods.of(context)
                      .navigateTo(ModifyOwnerProfileView()),
                ),
                RoundedButton(
                  text: AppStrings.deactivate,
                  size: Size(150, 40),
                  style:
                      AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                  onPress: showAskDeactivateAccountDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getData() async {
    User user = await UserService.getUser(Preferences.getUser.documentNumber);
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(user.birthDay);
    setState(() {
      birthDay = formatted;
      name = user.name;
      lastName = user.lastName;
      secondLastName = user.lastName;
      email = user.email;
      phone = user.phone.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
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
