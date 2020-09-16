import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/sync_wearable/widgets/sync_wearable_content.dart';
import 'package:flutter/material.dart';

class SyncWearableView extends StatefulWidget {
  SyncWearableView({Key key}) : super(key: key);

  @override
  _SyncWearableViewState createState() => _SyncWearableViewState();
}

class _SyncWearableViewState extends State<SyncWearableView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.syncWearable, showHeader: true),
            Expanded(child: SyncWearableContent()),
          ],
        ),
      ),
    );
  }
}