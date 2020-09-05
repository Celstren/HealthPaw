import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class SoundsContent extends StatefulWidget {
  SoundsContent({Key key}) : super(key: key);

  @override
  _SoundsContentState createState() => _SoundsContentState();
}

class _SoundsContentState extends State<SoundsContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            PetAvatar(name: "Firulays"),
            SizedBox(height: 10),
            StatsOverview(
              metricUnit: AppStrings.decibelsAbb,
              subtitle: AppStrings.todaySoundIntensity,
              ruleMetrics: false,
              min: false,
            ),
          ],
        ),
      ),
    );
  }
}
