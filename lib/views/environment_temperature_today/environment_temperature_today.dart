import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/environment_temperature_today/widgets/environment_temperature_today_content.dart';
import 'package:flutter/material.dart';

class EnvironmentTemperatureTodayView extends StatefulWidget {
  final Pet pet;
  EnvironmentTemperatureTodayView({Key key, this.pet}) : super(key: key);

  @override
  _EnvironmentTemperatureTodayViewState createState() =>
      _EnvironmentTemperatureTodayViewState();
}

class _EnvironmentTemperatureTodayViewState
    extends State<EnvironmentTemperatureTodayView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(
                title: AppStrings.environmentalTemperature, showHeader: true),
            Expanded(child: EnvironmentTemperatureTodayContent(pet: widget.pet)),
          ],
        ),
      ),
    );
  }
}
