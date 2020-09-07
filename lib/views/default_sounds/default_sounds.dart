import 'package:HealthPaw/views/default_sounds/widgets/default_sounds_content.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';

class DefaultSoundsView extends StatefulWidget {
  DefaultSoundsView({Key key}) : super(key: key);

  @override
  _DefaultSoundsViewState createState() => _DefaultSoundsViewState();
}

class _DefaultSoundsViewState extends State<DefaultSoundsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.defaultSound, showHeader: true),
            Expanded(child: DefaultSoundsContent()),
          ],
        ),
      ),
    );
  }
}