import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/sound_history/widgets/sound_history_content.dart';
import 'package:HealthPaw/views/sound_today/sound_today.dart';
import 'package:flutter/material.dart';

class SoundHistoryView extends StatefulWidget {
  final bool backToToday;
  final Pet pet;
  SoundHistoryView({Key key, this.backToToday = false, this.pet}) : super(key: key);

  @override
  _SoundHistoryViewState createState() => _SoundHistoryViewState();
}

class _SoundHistoryViewState extends State<SoundHistoryView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.backToToday) {
          NavigationMethods.of(context).navigateReplacement(SoundTodayView(pet: widget.pet));
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
                    ? () => NavigationMethods.of(context)
                        .navigateReplacement(SoundTodayView(pet: widget.pet))
                    : null,
              ),
              Expanded(child: SoundHistoryContent(pet: widget.pet)),
            ],
          ),
        ),
      ),
    );
  }
}
