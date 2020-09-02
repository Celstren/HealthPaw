import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/locate_pet/widgets/locate_pet_content.dart';
import 'package:flutter/material.dart';

class LocatePetView extends StatefulWidget {
  LocatePetView({Key key}) : super(key: key);

  @override
  _LocatePetViewState createState() => _LocatePetViewState();
}

class _LocatePetViewState extends State<LocatePetView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.locatePet, showHeader: true),
            Expanded(child: LocatePetContent()),
          ],
        ),
      ),
    );
  }
}