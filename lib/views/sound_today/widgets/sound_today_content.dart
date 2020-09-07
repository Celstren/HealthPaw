import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:HealthPaw/views/sound_history/sound_history.dart';
import 'package:flutter/material.dart';

class SoundTodayContent extends StatefulWidget {
  SoundTodayContent({Key key}) : super(key: key);

  @override
  _SoundTodayContentState createState() => _SoundTodayContentState();
}

class _SoundTodayContentState extends State<SoundTodayContent> {
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
              subtitle: AppStrings.todaySoundIntensity,
              history: SoundHistoryView(backToToday: true),
            ),
          ],
        ),
      ),
    );
  }
}
