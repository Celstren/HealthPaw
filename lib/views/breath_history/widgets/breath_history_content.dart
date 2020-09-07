import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/config/strings/app_units.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class BreathHistoryContent extends StatefulWidget {
  BreathHistoryContent({Key key}) : super(key: key);

  @override
  _BreathHistoryContentState createState() => _BreathHistoryContentState();
}

class _BreathHistoryContentState extends State<BreathHistoryContent> {
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
              metricUnit: AppStrings.breathsPerMinuteUnits,
              units: AppUnits.breathMetricUnits,
              subtitle: AppStrings.breathFrequencyHistory,
            ),
          ],
        ),
      ),
    );
  }
}
