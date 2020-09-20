import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/views/manual_register/manual_register.dart';
import 'package:HealthPaw/views/user_list/user_list.dart';
import 'package:flutter/material.dart';

class SelectUserTypeContent extends StatefulWidget {
  final SelectType selectType;
  SelectUserTypeContent({Key key, this.selectType = SelectType.Register})
      : super(key: key);

  @override
  _SelectUserTypeContentState createState() => _SelectUserTypeContentState();
}

class _SelectUserTypeContentState extends State<SelectUserTypeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircularButton(
              size: 80,
              label: AppStrings.veterinarian,
              onPress: () {
                if (widget.selectType == SelectType.Register) {
                  NavigationMethods.of(context)
                      .navigateTo(ManualRegisterView(userType: UserType.Vet));
                } else {
                  NavigationMethods.of(context)
                      .navigateTo(UserListView(userType: UserType.Vet));
                }
              },
              icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
            ),
            CircularButton(
              size: 80,
              label: AppStrings.owners,
              onPress: () {
                if (widget.selectType == SelectType.Register) {
                  NavigationMethods.of(context)
                      .navigateTo(ManualRegisterView(userType: UserType.Owner));
                } else {
                  NavigationMethods.of(context)
                      .navigateTo(UserListView(userType: UserType.Owner));
                }
              },
              icon: Icon(Icons.person, size: 30, color: AppColors.PrimaryBlack),
            ),
            CircularButton(
              size: 80,
              label: AppStrings.administrator,
              onPress: () {
                if (widget.selectType == SelectType.Register) {
                  NavigationMethods.of(context)
                      .navigateTo(ManualRegisterView(userType: UserType.Admin));
                } else {
                  NavigationMethods.of(context)
                      .navigateTo(UserListView(userType: UserType.Admin));
                }
              },
              icon: Icon(Icons.person, size: 30, color: AppColors.PrimaryBlack),
            )
          ],
        ))
      ],
    );
  }
}
