import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class PetStatusContent extends StatefulWidget {
  PetStatusContent({Key key}) : super(key: key);

  @override
  _PetStatusContentState createState() => _PetStatusContentState();
}

class _PetStatusContentState extends State<PetStatusContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.statusOverview,
           icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
         ),
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.hearthRate,
           icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
         ),
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.breathFrequency,
           icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
         ),
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.physicalActivity,
           icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
         ),
       ],
    );
  }
}