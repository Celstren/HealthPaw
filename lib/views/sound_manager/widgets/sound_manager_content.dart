import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:flutter/material.dart';

class SoundManagerContent extends StatefulWidget {
  SoundManagerContent({Key key}) : super(key: key);

  @override
  _SoundManagerContentState createState() => _SoundManagerContentState();
}

class _SoundManagerContentState extends State<SoundManagerContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        PetAvatar(),
        CircularButton(
          size: 80,
          onPress: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Container())),
          label: AppStrings.historySound,
          icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
        ),
      ],
    );
  }
}
