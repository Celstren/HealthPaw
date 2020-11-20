import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/report_pet_status/widgets/select_pet_status_report_content.dart';
import 'package:flutter/material.dart';

class SelectPetStatusReport extends StatefulWidget {
  final Pet pet;
  SelectPetStatusReport({Key key, this.pet}) : super(key: key);

  @override
  _SelectPetStatusReportState createState() => _SelectPetStatusReportState();
}

void _onClick() {}

class _SelectPetStatusReportState extends State<SelectPetStatusReport> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(
              title: AppStrings.petStatus, showHeader: true
            ),
            Expanded(
              child: SelectPetStatusReportContent(pet: widget.pet)
            ),
          ],
        ),
      ),
    );
  }
}
