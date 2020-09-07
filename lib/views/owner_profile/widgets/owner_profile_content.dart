import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/two_options_dialog.dart';
import 'package:flutter/material.dart';

class OwnerProfileContent extends StatefulWidget {
  OwnerProfileContent({Key key}) : super(key: key);

  @override
  _OwnerProfileContentState createState() => _OwnerProfileContentState();
}

class _OwnerProfileContentState extends State<OwnerProfileContent> {

  void showAskDeactivateAccountDialog() {
    showCustomDialog(
      context: context,
      child: CustomDialog(
        backgroundColor: Colors.transparent,
        child: TwoOptionsDialog(
          title: AppStrings.askDeactivateAccount,
          leftOptionText: AppStrings.accept,
          rightOptionText: AppStrings.close,
          onLeftPress: () {
            Navigator.pop(context);
            showDeactivateSuccessDialog();
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
          onPress: () {},
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
                      _buildOverviewField(
                          label: AppStrings.names, text: "Jose Miguel"),
                      SizedBox(height: 10),
                      _buildOverviewField(
                          label: AppStrings.lastnames, text: "Cruz Muñoz"),
                      SizedBox(height: 10),
                      _buildOverviewField(
                          label: AppStrings.mobileNumber, text: "957486878"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 110,
                        width: 90,
                        child: Placeholder(),
                      ),
                      SizedBox(height: 10),
                      RoundedButton(
                        size: Size(150, 30),
                        text: AppStrings.deactivateUser,
                        style: AppTextStyle.whiteStyle(
                            fontSize: AppFontSizes.text12,
                            fontWeight: FontWeight.bold),
                        onPress: showAskDeactivateAccountDialog,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildOverviewField(
                  label: AppStrings.birthDay, text: "04/07/1994"),
              SizedBox(height: 10),
              _buildOverviewField(
                  label: AppStrings.email, text: "jmcruz@hotmail.com"),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundedButton(
                    text: AppStrings.modify,
                    size: Size(150, 40),
                    style:
                        AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                    onPress: showAskDeactivateAccountDialog,
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
