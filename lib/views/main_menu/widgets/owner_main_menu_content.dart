import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/views/pet_list/pet_list.dart';
import 'package:HealthPaw/views/select_pet_type/select_pet_type.dart';
import 'package:HealthPaw/views/sound_manager/sound_manager.dart';
import 'package:HealthPaw/views/sync_wearable/sync_wearable.dart';
import 'package:flutter/material.dart';

class OwnerMainMenuContent extends StatefulWidget {
  OwnerMainMenuContent({Key key}) : super(key: key);

  @override
  _OwnerMainMenuContentState createState() => _OwnerMainMenuContentState();
}

class _OwnerMainMenuContentState extends State<OwnerMainMenuContent> {
  User user = Preferences.getUser;

  void check() {
    if (user?.pets?.length == 0) {
      NavigationMethods.of(context).navigateTo(SelectPetTypeView());
    } else {
      NavigationMethods.of(context).navigateTo(PetListView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircularButton(
          size: 80,
          onPress: () =>
              NavigationMethods.of(context).navigateTo(SelectPetTypeView()),
          label: AppStrings.registerPet,
          icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
        ),
        CircularButton(
          size: 80,
          onPress: check,
          label: AppStrings.pets,
          icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
        ),
        CircularButton(
          size: 80,
          onPress: () =>
              NavigationMethods.of(context).navigateTo(SyncWearableView()),
          label: AppStrings.collars,
          icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
        ),
        CircularButton(
          size: 80,
          onPress: () =>
              NavigationMethods.of(context).navigateTo(SoundManagerView()),
          label: AppStrings.defaultSound,
          icon: Icon(Icons.music_note, size: 30, color: AppColors.PrimaryBlack),
        ),
      ],
    );
  }
}
