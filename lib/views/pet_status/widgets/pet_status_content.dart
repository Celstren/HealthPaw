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
  double divisionSize = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: divisionSize),
          CircularButton(
            size: 80,
            press: () {},
            label: AppStrings.statusOverview,
            icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
          ),
          SizedBox(height: divisionSize),
          CircularButton(
            size: 80,
            press: () {},
            label: AppStrings.hearthRate,
            icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
          ),
          SizedBox(height: divisionSize),
          CircularButton(
            size: 80,
            press: () {},
            label: AppStrings.breathFrequency,
            icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
          ),
          SizedBox(height: divisionSize),
          CircularButton(
            size: 80,
            press: () {},
            label: AppStrings.physicalActivity,
            icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
          ),
          SizedBox(height: divisionSize),
          CircularButton(
            size: 80,
            press: () {},
            label: AppStrings.sounds,
            icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
          ),
          SizedBox(height: divisionSize),
          CircularButton(
            size: 80,
            press: () {},
            label: AppStrings.environmentalTemperature,
            icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
          ),
          SizedBox(height: divisionSize),
          CircularButton(
            size: 80,
            press: () {},
            label: AppStrings.localization,
            icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
          ),
          SizedBox(height: divisionSize),
        ],
      ),
    ),
    );
  }
}
