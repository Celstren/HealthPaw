import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:HealthPaw/views/physical_activity_history/physical_activity_history.dart';
import 'package:flutter/material.dart';

class PhysicalActivityTodayContent extends StatefulWidget {
  final Pet pet;
  PhysicalActivityTodayContent({Key key, this.pet}) : super(key: key);

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
            PetAvatar(name: widget.pet.namevar),
            SizedBox(height: 10),
            StatsOverview(
              stadistic: widget.pet.physicalActivity,
              type: StadisticType.TODAY,
              metricUnit: AppStrings.minutesAbb,
              subtitle: AppStrings.hearthRateHistory,
              reduceData: true,
              history: PhysicalActivityHistoryView(backToToday: true, pet: widget.pet),
            ),
          ],
        ),
      ),
    );
  }
}
