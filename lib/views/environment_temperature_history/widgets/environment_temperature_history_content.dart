import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/config/strings/app_units.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
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

    if(widget.pet.temperature.isEmpty){
      showCustomDialog(
        context: context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: Text(AppStrings.noDataChartMessage),
        ),
      );
    }


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
              type: StadisticType.HISTORY,
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
