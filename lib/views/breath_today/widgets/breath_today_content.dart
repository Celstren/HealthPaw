import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/config/strings/app_units.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:HealthPaw/views/breath_history/breath_history.dart';
import 'package:flutter/material.dart';

class BreathTodayContent extends StatefulWidget {
  final Pet pet;
  BreathTodayContent({Key key, this.pet}) : super(key: key);

  @override
  _BreathTodayContentState createState() => _BreathTodayContentState();
}

class _BreathTodayContentState extends State<BreathTodayContent> {
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
              metricUnit: AppStrings.breathsPerMinuteUnits,
              units: AppUnits.breathMetricUnits,
              subtitle: AppStrings.todayBreathFrequency,
              history: BreathHistoryView(backToToday: true),
            ),
          ],
        ),
      ),
    );
  }
}
