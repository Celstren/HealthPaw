import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class SoundsContent extends StatefulWidget {
  final Pet pet;
  SoundsContent({Key key, this.pet}) : super(key: key);

  @override
  _SoundsContentState createState() => _SoundsContentState();
}

class _SoundsContentState extends State<SoundsContent> {
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
              stadistic: widget.pet.sound,
              type: StadisticType.HISTORY,
              metricUnit: AppStrings.decibelsAbb,
              subtitle: AppStrings.todaySoundIntensity,
              min: false,
            ),
          ],
        ),
      ),
    );
  }
}
