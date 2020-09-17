import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/pet_info/widgets/pet_info_content.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/select_pet_type_content.dart';
import 'package:flutter/material.dart';

enum PetTypeInfo { Register, Modify }

class PetInfoView extends StatefulWidget {
  final PetType petType;
  final Pet pet;
  PetInfoView({Key key, this.petType = PetType.Dog, this.pet}) : super(key: key);

  @override
  _PetInfoViewState createState() => _PetInfoViewState();
}

class _PetInfoViewState extends State<PetInfoView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: widget.pet == null ? AppStrings.registerPet : AppStrings.modifyPet, showHeader: true),
            Expanded(child: PetInfoContent(pet: widget.pet)),
          ],
        ),
      ),
    );
  }
}