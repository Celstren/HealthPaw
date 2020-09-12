import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/pet_overview/widgets/pet_overview_content.dart';
import 'package:flutter/material.dart';

class PetOverviewView extends StatefulWidget {
  PetOverviewView({Key key}) : super(key: key);

  @override
  _PetOverviewViewState createState() => _PetOverviewViewState();
}

class _PetOverviewViewState extends State<PetOverviewView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petOverview, showHeader: true),
            Expanded(child: PetOverviewContent()),
          ],
        ),
      ),
    );
  }
}
