import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/sounds/widgets/sounds_content.dart';
import 'package:flutter/material.dart';

class SoundsView extends StatefulWidget {
  SoundsView({Key key}) : super(key: key);

  @override
  _SoundsViewState createState() => _SoundsViewState();
}

class _SoundsViewState extends State<SoundsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.breathHistory, showHeader: true),
            Expanded(child: SoundsContent()),
          ],
        ),
      ),
    );
  }
}
