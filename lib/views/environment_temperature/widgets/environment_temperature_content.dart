import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/config/strings/app_units.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class EnvironmentTemperatureContent extends StatefulWidget {
  EnvironmentTemperatureContent({Key key}) : super(key: key);

  @override
  _EnvironmentTemperatureContentState createState() => _EnvironmentTemperatureContentState();
}

class _EnvironmentTemperatureContentState extends State<EnvironmentTemperatureContent> {
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
              metricUnit: AppStrings.temperatureUnits,
              units: AppUnits.temperatureMetricUnits,
              subtitle: AppStrings.todayEnvironmentalTemperature,
            ),
          ],
        ),
      ),
    );
  }
}
