import 'package:HealthPaw/views/sound_today/widgets/sound_today_content.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class SoundTodayView extends StatefulWidget {
  SoundTodayView({Key key}) : super(key: key);

  @override
  _SoundTodayViewState createState() => _SoundTodayViewState();
}

class _SoundTodayViewState extends State<SoundTodayView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.sounds, showHeader: true),
            Expanded(child: SoundTodayContent()),
          ],
        ),
      ),
    );
  }
}