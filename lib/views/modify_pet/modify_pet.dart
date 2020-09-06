import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/modify_pet_content.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/select_pet_type_content.dart';
import 'package:flutter/material.dart';

class ModifyPetView extends StatefulWidget {
  final PetType petType;
  ModifyPetView({Key key, this.petType = PetType.Dog}) : super(key: key);

  @override
  _ModifyPetViewState createState() => _ModifyPetViewState();
}

class _ModifyPetViewState extends State<ModifyPetView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petStatus, showHeader: true),
            Expanded(child: ModifyPetContent()),
          ],
        ),
      ),
    );
  }
}