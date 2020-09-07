import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:HealthPaw/views/physical_activity_history/physical_activity_history.dart';
import 'package:flutter/material.dart';

class PhysicalActivityTodayContent extends StatefulWidget {
  PhysicalActivityTodayContent({Key key}) : super(key: key);

  @override
  _PhysicalActivityTodayContentState createState() => _PhysicalActivityTodayContentState();
}

class _PhysicalActivityTodayContentState extends State<PhysicalActivityTodayContent> {
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
              metricUnit: AppStrings.minutesAbb,
              subtitle: AppStrings.hearthRateHistory,
              reduceData: true,
              history: PhysicalActivityHistoryView(backToToday: true),
            ),
          ],
        ),
      ),
    );
  }
}
