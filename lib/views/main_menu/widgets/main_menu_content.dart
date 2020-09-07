import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class MainMenuContent extends StatefulWidget {
  MainMenuContent({Key key}) : super(key: key);

  @override
  _MainMenuContentState createState() => _MainMenuContentState();
}

class _MainMenuContentState extends State<MainMenuContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         CircularButton(
           size: 80,
           onPress: () {},
           label: AppStrings.registerPet,
           icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
         ),
         CircularButton(
           size: 80,
           onPress: () {},
           label: AppStrings.pets,
           icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
         ),
         CircularButton(
           size: 80,
           onPress: () {},
           label: AppStrings.collars,
           icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
         ),
       ],
    );
  }
}