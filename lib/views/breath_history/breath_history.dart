import 'package:HealthPaw/views/breath_history/widgets/breath_history_content.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class BreathHistoryView extends StatefulWidget {
  BreathHistoryView({Key key}) : super(key: key);

  @override
  _BreathHistoryViewState createState() => _BreathHistoryViewState();
}

class _BreathHistoryViewState extends State<BreathHistoryView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.breathHistory, showHeader: true),
            Expanded(child: BreathHistoryContent()),
          ],
        ),
      ),
    );
  }
}