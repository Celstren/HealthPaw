import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/views/select_user_type/select_user_type.dart';
import 'package:flutter/material.dart';

class AdminMainMenuContent extends StatefulWidget {
  AdminMainMenuContent({Key key}) : super(key: key);

  @override
  _AdminMainMenuContentState createState() => _AdminMainMenuContentState();
}

class _AdminMainMenuContentState extends State<AdminMainMenuContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircularButton(
          size: 80,
          onPress: () => NavigationMethods.of(context)
              .navigateTo(SelectUserTypeView(selectType: SelectType.Register)),
          label: AppStrings.registerUsers,
          icon: Icon(Icons.person_add, size: 30, color: AppColors.PrimaryBlack),
        ),
        CircularButton(
          size: 80,
          onPress: () => NavigationMethods.of(context)
              .navigateTo(SelectUserTypeView(selectType: SelectType.List)),
          label: AppStrings.users,
          icon: Icon(Icons.person, size: 30, color: AppColors.PrimaryBlack),
        ),
      ],
    );
  }
}
