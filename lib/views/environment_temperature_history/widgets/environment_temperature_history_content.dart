import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/config/strings/app_units.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class EnvironmentTemperatureHistoryContent extends StatefulWidget {
  final Pet pet;
  EnvironmentTemperatureHistoryContent({Key key, this.pet}) : super(key: key);

  @override
  _EnvironmentTemperatureHistoryContentState createState() => _EnvironmentTemperatureHistoryContentState();
}

class _EnvironmentTemperatureHistoryContentState extends State<EnvironmentTemperatureHistoryContent> {
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
              pet: widget.pet,
              metricUnit: AppStrings.temperatureUnits,
              units: AppUnits.temperatureMetricUnits,
              subtitle: AppStrings.environmentalTemperatureHistory,
            ),
          ],
        ),
      ),
    );
  }
}
