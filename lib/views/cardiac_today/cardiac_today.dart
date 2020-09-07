import 'package:HealthPaw/views/cardiac_today/widgets/cardiac_today_content.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class CardiacTodayView extends StatefulWidget {
  CardiacTodayView({Key key}) : super(key: key);

  @override
  _CardiacTodayViewState createState() => _CardiacTodayViewState();
}

class _CardiacTodayViewState extends State<CardiacTodayView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.hearthRate, showHeader: true),
            Expanded(child: CardiacTodayContent()),
          ],
        ),
      ),
    );
  }
}