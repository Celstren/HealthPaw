import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/overview_field.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class PetOverviewContent extends StatefulWidget {
  final Pet pet;
  PetOverviewContent({Key key, this.pet}) : super(key: key);

  @override
  _PetOverviewContentState createState() => _PetOverviewContentState();
}

class _PetOverviewContentState extends State<PetOverviewContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              PetAvatar(name: widget.pet.namevar),
              SizedBox(height: 40),
              OverviewField(
                  width: 400,
                  orientation: OverviewFieldOrientation.Horizontal,
                  label: AppStrings.cardiacFrequency,
                  text: "${widget.pet?.heartRate?.average?.toStringAsFixed(3) ?? 0} ${AppStrings.beatsPerMinuteUnits}"),
              SizedBox(height: 40),
              OverviewField(
                width: 400,
                orientation: OverviewFieldOrientation.Horizontal,
                label: AppStrings.breathFrequency,
                text: "${widget.pet?.breathingFrequency?.average?.toStringAsFixed(3) ?? 0} ${AppStrings.breathsPerMinuteUnits}",
              ),
              SizedBox(height: 40),
              OverviewField(
                  width: 400,
                  orientation: OverviewFieldOrientation.Horizontal,
                  label: AppStrings.physicalActivity,
                  text: "50 ${AppStrings.minimumAbb}"),
              SizedBox(height: 40),
              RoundedButton(
                size: Size(150, 30),
                text: AppStrings.variables,
                style: AppTextStyle.whiteStyle(
                    fontSize: AppFontSizes.text14, fontWeight: FontWeight.bold),
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
