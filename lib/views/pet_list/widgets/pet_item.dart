import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/services/pet/pet.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/loading_screen.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/views/pet_info/pet_info.dart';
import 'package:HealthPaw/views/pet_list/widgets/pet_dialog.dart';
import 'package:HealthPaw/views/pet_status/pet_status.dart';
import 'package:flutter/material.dart';

class PetItem extends StatelessWidget {
  final Pet pet;
  const PetItem({Key key, this.pet}) : super(key: key);

  void displayPetData(BuildContext context) async {
    displayLoadingScreen(context);
    Pet petData = await PetService.getPet(pet.id);
    Navigator.pop(context);
    if (petData != null) {
      NavigationMethods.of(context).navigateTo(PetInfoView(pet: petData));
    } else {
      showCustomDialog(
          context: context,
          builder: (context) => CustomDialog(
            child: OkDialog(
              title: AppStrings.fetchPetFail,
              okText: AppStrings.ok,
              onPress: () => Navigator.pop(
                    context,
                  )),
          ));
    }
  }

  void displayPetStatus(BuildContext context) async {
    displayLoadingScreen(context);
    Pet petData = await PetService.getPet(pet.id);
    Navigator.pop(context);
    if (petData != null) {
      NavigationMethods.of(context).navigateTo(PetStatusView(pet: petData));
    } else {
      showCustomDialog(
          context: context,
          builder: (context) => CustomDialog(
            child: OkDialog(
              title: AppStrings.fetchPetFail,
              okText: AppStrings.ok,
              onPress: () => Navigator.pop(
                    context,
                  )),
          ));
    }
  }

  void showPetDialog(BuildContext context) {
    showCustomDialog(
        context: context,
        builder: (context) =>
            CustomDialog(child: PetDialog(petName: pet.namevar)));
  }

  @override
  Widget build(BuildContext context) {
    return Preferences.getUser.type == ConstantHelper.USER_TYPE_VET_ID
        ? _vetItem(context)
        : _ownerItem(context);
  }

  Widget _vetItem(BuildContext context) {
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
              blurRadius: 5.0,
              spreadRadius: 5.0)
        ],
      ),
      child: FlatButton(
        onPressed: () => showPetDialog(context),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 30),
              child: PetAvatar(size: 60),
            ),
            Expanded(
              child: Text(
                pet?.namevar ?? "",
                style: AppTextStyle.blackStyle(
                    fontSize: AppFontSizes.subitle18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerItem(BuildContext context) {
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
              blurRadius: 5.0,
              spreadRadius: 5.0)
        ],
      ),
      child: FlatButton(
        onPressed: () => displayPetStatus(context),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 30),
              child: PetAvatar(size: 60),
            ),
            Expanded(
              child: Text(
                pet?.namevar ?? "",
                style: AppTextStyle.blackStyle(
                    fontSize: AppFontSizes.subitle18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => displayPetData(context),
                  child: Center(
                      child: Icon(Icons.edit,
                          size: 30, color: AppColors.PrimaryBlack))),
            )
          ],
        ),
      ),
    );
  }
}
