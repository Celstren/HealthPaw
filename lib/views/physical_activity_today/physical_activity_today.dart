import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/physical_activity_today/widgets/physical_activity_today_content.dart';
import 'package:flutter/material.dart';

class PhysicalActivityTodayView extends StatefulWidget {
  final Pet pet;
  PhysicalActivityTodayView({Key key, this.pet}) : super(key: key);

  @override
  _PhysicalActivityTodayViewState createState() =>
      _PhysicalActivityTodayViewState();
}

class _PhysicalActivityTodayViewState extends State<PhysicalActivityTodayView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.physicalActivity, showHeader: true),
            Expanded(child: PhysicalActivityTodayContent(pet: widget.pet)),
          ],
        ),
      ),
    );
  }
}
