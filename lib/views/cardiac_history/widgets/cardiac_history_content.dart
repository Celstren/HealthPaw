import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/config/strings/app_units.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/stats_overview.dart';
import 'package:flutter/material.dart';

class CardiacHistoryContent extends StatefulWidget {
  final Pet pet;
  CardiacHistoryContent({Key key, this.pet}) : super(key: key);

  @override
  _CardiacHistoryContentState createState() => _CardiacHistoryContentState();
}

class _CardiacHistoryContentState extends State<CardiacHistoryContent> {
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
              metricUnit: AppStrings.beatsPerMinuteUnits,
              units: AppUnits.beatMetricUnits,
              subtitle: AppStrings.hearthRateHistory,
            ),
          ],
        ),
      ),
    );
  }
}
