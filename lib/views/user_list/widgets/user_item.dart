import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/services/user/user.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/loading_screen.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/views/user_info/user_info.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final User user;
  final UserType userType;
  const UserItem({Key key, this.user, this.userType = UserType.Owner})
      : super(key: key);

  void fetchPetData(BuildContext context) async {
    displayLoadingScreen(context);
    User userData = await UserService.getUser(user.documentNumber);
    Navigator.pop(context);
    if (userData != null) {
      NavigationMethods.of(context)
          .navigateTo(UserInfoView(user: userData, userType: userType));
    } else {
      showCustomDialog(
          context: context,
          builder: (context) => OkDialog(
              title: AppStrings.fetchPetFail,
              okText: AppStrings.ok,
              onPress: () => Navigator.pop(context)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius15),
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(3.0, 3.0),
              color: AppColors.PrimaryBlack.withOpacity(.25),
              blurRadius: 1.0,
              spreadRadius: 1.0)
        ],
      ),
      child: FlatButton(
          onPressed: () => fetchPetData(context),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, right: 30),
                child: PetAvatar(size: 60),
              ),
              Expanded(
                child: Text(
                  user?.userFullName,
                  style: AppTextStyle.blackStyle(
                      fontSize: AppFontSizes.subitle18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )),
    );
  }
}
