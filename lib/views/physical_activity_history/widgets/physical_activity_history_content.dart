import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class PhysicalActivityHistoryContent extends StatefulWidget {
  PhysicalActivityHistoryContent({Key key}) : super(key: key);

  @override
  _PhysicalActivityHistoryContentState createState() => _PhysicalActivityHistoryContentState();
}

class _PhysicalActivityHistoryContentState extends State<PhysicalActivityHistoryContent> {
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
              subtitle: AppStrings.physicalActivityHistory,
            ),
          ],
        ),
      ),
    );
  }
}
