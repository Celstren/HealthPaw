import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/sound_manager/widgets/sound_manager_content.dart';
import 'package:flutter/material.dart';

class SoundManagerView extends StatefulWidget {
  SoundManagerView({Key key}) : super(key: key);

  @override
  _SoundManagerViewState createState() => _SoundManagerViewState();
}

class _SoundManagerViewState extends State<SoundManagerView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.sounds, showHeader: true),
            Expanded(child: SoundManagerContent()),
          ],
        ),
      ),
    );
  }
}