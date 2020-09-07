import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class DefaultSoundItem extends StatelessWidget {
  const DefaultSoundItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 80,
            child: Placeholder(),
          ),
          RoundedButton(
            size: Size(90, 30),
            text: AppStrings.play,
            style: AppTextStyle.blackStyle(fontSize: AppFontSizes.text10),
            onPress: () {},
          ),
        ],
      ),
    );
  }
}