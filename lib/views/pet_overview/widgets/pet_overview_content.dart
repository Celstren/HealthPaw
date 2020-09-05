import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:flutter/material.dart';

class PetOverviewContent extends StatefulWidget {
  PetOverviewContent({Key key}) : super(key: key);

  @override
  _PetOverviewContentState createState() => _PetOverviewContentState();
}

class _PetOverviewContentState extends State<PetOverviewContent> {
  Widget _buildOverviewField(
      {String label = "", double unit, String unitMetric = ""}) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 200,
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
              "${unit.toStringAsFixed(0)} $unitMetric",
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              PetAvatar(name: "Firulays"),
              SizedBox(height: 10),
              _buildOverviewField(
                  label: AppStrings.cardiacFrequency,
                  unit: 100,
                  unitMetric: AppStrings.beatsPerMinuteUnits),
              _buildOverviewField(
                  label: AppStrings.breathFrequency,
                  unit: 20,
                  unitMetric: AppStrings.breathsPerMinuteUnits),
              _buildOverviewField(
                  label: AppStrings.physicalActivity,
                  unit: 50,
                  unitMetric: AppStrings.minimumAbb),
            ],
          ),
        ),
      ),
    );
  }
}
