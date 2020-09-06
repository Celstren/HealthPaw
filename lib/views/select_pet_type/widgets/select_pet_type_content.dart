import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/app_images.dart';
import 'package:HealthPaw/utils/widgets/circular_asset_image_button.dart';
import 'package:HealthPaw/views/modify_pet/modify_pet.dart';
import 'package:flutter/material.dart';

enum PetType { Dog, Cat }

class SelectPetTypeContent extends StatefulWidget {
  SelectPetTypeContent({Key key}) : super(key: key);

  @override
  _SelectPetTypeContentState createState() => _SelectPetTypeContentState();
}

class _SelectPetTypeContentState extends State<SelectPetTypeContent> {

  void displayModifyPetView(PetType petType) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ModifyPetView()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: Text(AppStrings.petType,
              style: AppTextStyle.blackStyle(
                  fontSize: AppFontSizes.subitle20,
                  fontWeight: FontWeight.w600)),
        ),
        SizedBox(height: 20),
        Expanded(
            child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            CircularAssetImageButton(
              size: 80,
              label: AppStrings.dog,
              path: AppImages.DogImage,
              onPress: () => displayModifyPetView(PetType.Dog),
            ),
            SizedBox(height: 60),
            CircularAssetImageButton(
              size: 80,
              label: AppStrings.cat,
              path: AppImages.CatImage,
              onPress: () => displayModifyPetView(PetType.Cat),
            ),
          ],
        ))
      ],
    );
  }
}
