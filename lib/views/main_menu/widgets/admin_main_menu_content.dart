import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class AdminMainMenuContent extends StatefulWidget {
  AdminMainMenuContent({Key key}) : super(key: key);

  @override
  _AdminMainMenuContentState createState() => _AdminMainMenuContentState();
}

class _AdminMainMenuContentState extends State<AdminMainMenuContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircularButton(
          size: 80,
          onPress: () {},
          label: AppStrings.registerUsers,
          icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
        ),
        CircularButton(
          size: 80,
          onPress: () {},
          label: AppStrings.users,
          icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
        ),
      ],
    );
  }
}
