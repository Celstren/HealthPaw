import 'package:HealthPaw/views/environment_temperature/widgets/environment_temperature_content.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class EnvironmentTemperatureView extends StatefulWidget {
  EnvironmentTemperatureView({Key key}) : super(key: key);

  @override
  _EnvironmentTemperatureViewState createState() => _EnvironmentTemperatureViewState();
}

class _EnvironmentTemperatureViewState extends State<EnvironmentTemperatureView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.environmentalTemperature, showHeader: true),
            Expanded(child: EnvironmentTemperatureContent()),
          ],
        ),
      ),
    );
  }
}