import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/pet_list/widgets/pet_list_content.dart';
import 'package:flutter/material.dart';

class PetListView extends StatefulWidget {
  PetListView({Key key}) : super(key: key);

  @override
  _PetListViewState createState() => _PetListViewState();
}

class _PetListViewState extends State<PetListView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(
              title: Preferences.getUser.type == ConstantHelper.USER_TYPE_VET_ID
                  ? AppStrings.petsAssigned
                  : AppStrings.petsList,
              showHeader: true,
            ),
            Expanded(child: PetListContent()),
          ],
        ),
      ),
    );
  }
}
