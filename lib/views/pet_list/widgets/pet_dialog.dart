import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class PetDialog extends StatefulWidget {
  final String petName;
  PetDialog({
    Key key,
    this.petName = "",
  }) : super(key: key);

  @override
  _PetDialogState createState() => _PetDialogState();
}

class _PetDialogState extends State<PetDialog> {

  bool isCollapsed = true;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Stack(
        children: <Widget>[
          isCollapsed ? _collapsedSection() : _uncollapsedSection(),
          SizedBox(
            height: 300,
            width: 360,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                PetAvatar()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _collapsedSection() {
    return Container(
            height: 200,
            width: 360,
            margin: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.all(radius: AppRadius.radius20),
              color: AppColors.PrimaryWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.petName,
                  style: AppTextStyle.blackStyle(
                      fontSize: AppFontSizes.title24,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                RoundedButton(
                  text: AppStrings.sendNotification,
                  size: Size(160, 40),
                  color: AppColors.PrimaryLightBlue,
                  style: AppTextStyle.whiteStyle(
                      fontSize: AppFontSizes.text12,
                      fontWeight: FontWeight.w500),
                  onPress: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                ),
              ],
            ),
          );
  }

  Widget _uncollapsedSection() {
    return Container(
            height: 350,
            width: 360,
            margin: EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.all(radius: AppRadius.radius20),
              color: AppColors.PrimaryWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.petName,
                  style: AppTextStyle.blackStyle(
                      fontSize: AppFontSizes.title24,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.PrimaryBlack, width: 1),
                    borderRadius: AppBorderRadius.all(radius: AppRadius.radius20),
                  ),
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration.collapsed(hintText: ""),
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  text: AppStrings.sendMessage,
                  size: Size(160, 40),
                  color: AppColors.PrimaryLightBlue,
                  style: AppTextStyle.whiteStyle(
                      fontSize: AppFontSizes.text12,
                      fontWeight: FontWeight.w500),
                  onPress: () {},
                ),
              ],
            ),
          );
  }
}
