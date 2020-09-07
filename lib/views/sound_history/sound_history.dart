import 'package:HealthPaw/views/sound_history/widgets/sound_history_content.dart';
import 'package:HealthPaw/views/sound_today/sound_today.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class SoundHistoryView extends StatefulWidget {
  final bool backToToday;
  SoundHistoryView({Key key, this.backToToday = false}) : super(key: key);

  @override
  _SoundHistoryViewState createState() => _SoundHistoryViewState();
}

class _SoundHistoryViewState extends State<SoundHistoryView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.backToToday) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => SoundTodayView()));
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              CommonAppBar(
                title: AppStrings.sounds,
                showHeader: true,
                handleBack: widget.backToToday
                    ? () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SoundTodayView()))
                    : null,
              ),
              Expanded(child: SoundHistoryContent()),
            ],
          ),
        ),
      ),
    );
  }
}
