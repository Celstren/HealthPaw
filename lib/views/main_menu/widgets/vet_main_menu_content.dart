import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/views/pet_list/pet_list.dart';
import 'package:flutter/material.dart';

class VetMainMenuContent extends StatefulWidget {
  VetMainMenuContent({Key key}) : super(key: key);

  @override
  _VetMainMenuContentState createState() => _VetMainMenuContentState();
}

class _VetMainMenuContentState extends State<VetMainMenuContent> {
  User user = Preferences.getUser;

  void check() {
    if (user?.pets?.length != 0) {
      NavigationMethods.of(context).navigateTo(PetListView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircularButton(
          size: 80,
          onPress: check,
          label: AppStrings.pets,
          icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
        ),
        CircularButton(
          size: 80,
          onPress: () {},
          label: AppStrings.alerts,
          icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
        ),
      ],
    );
  }
}
