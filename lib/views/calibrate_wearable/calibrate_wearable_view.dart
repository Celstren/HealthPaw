import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/calibrate_wearable/widgets/calibrate_wearable_content.dart';
import 'package:flutter/material.dart';

class CalibrateWearableView extends StatefulWidget {
  CalibrateWearableView({Key key}) : super(key: key);

  @override
  _CalibrateWearableViewState createState() => _CalibrateWearableViewState();
}

class _CalibrateWearableViewState extends State<CalibrateWearableView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.calibrateWearable, showHeader: true),
            Expanded(child: CalibrateWearableContent()),
          ],
        ),
      ),
    );
  }
}