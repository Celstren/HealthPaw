import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/select_pet_type_content.dart';
import 'package:flutter/material.dart';

class SelectPetTypeView extends StatefulWidget {
  SelectPetTypeView({Key key}) : super(key: key);

  @override
  _SelectPetTypeViewState createState() => _SelectPetTypeViewState();
}

class _SelectPetTypeViewState extends State<SelectPetTypeView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petStatus, showHeader: true),
            Expanded(child: SelectPetTypeContent()),
          ],
        ),
      ),
    );
  }
}
