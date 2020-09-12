import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/views/physical_activity_history/widgets/physical_activity_history_content.dart';
import 'package:HealthPaw/views/physical_activity_today/physical_activity_today.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class PhysicalActivityHistoryView extends StatefulWidget {
  final bool backToToday;
  PhysicalActivityHistoryView({Key key, this.backToToday = false})
      : super(key: key);

  @override
  _PhysicalActivityHistoryViewState createState() =>
      _PhysicalActivityHistoryViewState();
}

class _PhysicalActivityHistoryViewState
    extends State<PhysicalActivityHistoryView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.backToToday) {
          NavigationMethods.of(context).navigateReplacement(PhysicalActivityTodayView());
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              CommonAppBar(
                title: AppStrings.physicalActivityHistory,
                showHeader: true,
                handleBack: widget.backToToday
                    ? () => NavigationMethods.of(context).navigateReplacement(PhysicalActivityTodayView())
                    : null,
              ),
              Expanded(child: PhysicalActivityHistoryContent()),
            ],
          ),
        ),
      ),
    );
  }
}
