import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class SoundHistoryContent extends StatefulWidget {
  SoundHistoryContent({Key key}) : super(key: key);

  @override
  _SoundHistoryContentState createState() => _SoundHistoryContentState();
}

class _SoundHistoryContentState extends State<SoundHistoryContent> {
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
              subtitle: AppStrings.soundHistory,
            ),
          ],
        ),
      ),
    );
  }
}