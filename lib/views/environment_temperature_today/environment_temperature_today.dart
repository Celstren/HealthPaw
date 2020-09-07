import 'package:HealthPaw/views/environment_temperature_today/widgets/environment_temperature_today_content.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class EnvironmentTemperatureTodayView extends StatefulWidget {
  EnvironmentTemperatureTodayView({Key key}) : super(key: key);

  @override
  _EnvironmentTemperatureTodayViewState createState() => _EnvironmentTemperatureTodayViewState();
}

class _EnvironmentTemperatureTodayViewState extends State<EnvironmentTemperatureTodayView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.environmentalTemperature, showHeader: true),
            Expanded(child: EnvironmentTemperatureTodayContent()),
          ],
        ),
      ),
    );
  }
}