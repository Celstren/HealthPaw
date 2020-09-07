import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/pet_profile/widgets/pet_profile_content.dart';
import 'package:flutter/material.dart';

class PetProfileView extends StatefulWidget {
  final Pet pet;
  PetProfileView({Key key, this.pet}) : super(key: key);

  @override
  _PetProfileViewState createState() => _PetProfileViewState();
}

class _PetProfileViewState extends State<PetProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petProfile, showHeader: true),
            Expanded(child: PetProfileContent(pet: widget.pet)),
          ],
        ),
      ),
    );
  }
}
