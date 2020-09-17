import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/config/strings/app_units.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:HealthPaw/views/environment_temperature_history/environment_temperature_history.dart';
import 'package:flutter/material.dart';

class EnvironmentTemperatureTodayContent extends StatefulWidget {
  final Pet pet;
  EnvironmentTemperatureTodayContent({Key key, this.pet}) : super(key: key);

  @override
  _EnvironmentTemperatureTodayContentState createState() => _EnvironmentTemperatureTodayContentState();
}

class _EnvironmentTemperatureTodayContentState extends State<EnvironmentTemperatureTodayContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            PetAvatar(name: widget.pet.namevar),
            SizedBox(height: 10),
            StatsOverview(
              stadistic: widget.pet.temperature,
              type: StadisticType.TODAY,
              metricUnit: AppStrings.temperatureUnits,
              units: AppUnits.temperatureMetricUnits,
              subtitle: AppStrings.todayEnvironmentalTemperature,
              history: EnvironmentTemperatureHistoryView(backToToday: true),
            ),
          ],
        ),
      ),
    );
  }
}
