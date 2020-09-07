import 'package:HealthPaw/views/environment_temperature_history/widgets/environment_temperature_history_content.dart';
import 'package:HealthPaw/views/environment_temperature_today/environment_temperature_today.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class EnvironmentTemperatureHistoryView extends StatefulWidget {
  final bool backToToday;
  EnvironmentTemperatureHistoryView({Key key, this.backToToday = false})
      : super(key: key);

  @override
  _EnvironmentTemperatureHistoryViewState createState() =>
      _EnvironmentTemperatureHistoryViewState();
}

class _EnvironmentTemperatureHistoryViewState
    extends State<EnvironmentTemperatureHistoryView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.backToToday) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  EnvironmentTemperatureTodayView()));
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              CommonAppBar(
                title: AppStrings.temperatureHistory,
                showHeader: true,
                handleBack: widget.backToToday
                    ? () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                EnvironmentTemperatureTodayView()))
                    : null,
              ),
              Expanded(child: EnvironmentTemperatureHistoryContent()),
            ],
          ),
        ),
      ),
    );
  }
}
