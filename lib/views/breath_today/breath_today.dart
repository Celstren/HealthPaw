import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/views/breath_today/widgets/breath_today_content.dart';
import 'package:flutter/material.dart';

class BreathTodayView extends StatefulWidget {
  final Pet pet;
  BreathTodayView({Key key, this.pet}) : super(key: key);

  @override
  _BreathTodayViewState createState() => _BreathTodayViewState();
}

class _BreathTodayViewState extends State<BreathTodayView> {
  @override
  Widget build(BuildContext context) {

    if(widget.pet.breathingFrequency.isEmpty){
      showCustomDialog(
        context: context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: Text(AppStrings.noDataChartMessage),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.breathFrequency, showHeader: true),
            Expanded(child: BreathTodayContent(pet: widget.pet)),
          ],
        ),
      ),
    );
  }
}
