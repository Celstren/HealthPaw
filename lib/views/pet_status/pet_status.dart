import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/pet_status/widgets/pet_status_content.dart';
import 'package:flutter/material.dart';

class PetStatusView extends StatefulWidget {
  final Pet pet;
  PetStatusView({Key key, this.pet}) : super(key: key);

  @override
  _PetStatusViewState createState() => _PetStatusViewState();
}

class _PetStatusViewState extends State<PetStatusView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petStatus, showHeader: true),
            Expanded(child: PetStatusContent(pet: widget.pet)),
          ],
        ),
      ),
    );
  }
}
