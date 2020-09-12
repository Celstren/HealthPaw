import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/views/breath_history/widgets/breath_history_content.dart';
import 'package:HealthPaw/views/breath_today/breath_today.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class BreathHistoryView extends StatefulWidget {
  final bool backToToday;
  BreathHistoryView({Key key, this.backToToday = false}) : super(key: key);

  @override
  _BreathHistoryViewState createState() => _BreathHistoryViewState();
}

class _BreathHistoryViewState extends State<BreathHistoryView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.backToToday) {
          NavigationMethods.of(context).navigateReplacement(BreathTodayView());
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              CommonAppBar(
                title: AppStrings.breathHistory,
                showHeader: true,
                handleBack: widget.backToToday
                    ? () => NavigationMethods.of(context).navigateReplacement(BreathTodayView())
                    : null,
              ),
              Expanded(child: BreathHistoryContent()),
            ],
          ),
        ),
      ),
    );
  }
}
