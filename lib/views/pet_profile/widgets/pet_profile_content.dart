import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/overview_field.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PetProfileContent extends StatefulWidget {
  final Pet pet;
  PetProfileContent({Key key, this.pet}) : super(key: key);

  @override
  _PetProfileContentState createState() => _PetProfileContentState();
}

class _PetProfileContentState extends State<PetProfileContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Center(child: PetAvatar()),
              SizedBox(height: 10),
              OverviewField(
                  label: AppStrings.names, text: widget.pet?.namevar ?? ""),
              SizedBox(height: 20),
              OverviewField(
                  label: AppStrings.birthDay,
                  text: DateFormat("dd/MM/yyyy")
                      .format(widget.pet?.birthDay ?? DateTime.now())),
              SizedBox(height: 50),
              Center(
                child: RoundedButton(
                  size: Size(150, 30),
                  text: AppStrings.status,
                  style: AppTextStyle.whiteStyle(
                      fontSize: AppFontSizes.text14,
                      fontWeight: FontWeight.bold),
                  onPress: () {},
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: RoundedButton(
                  size: Size(150, 30),
                  text: AppStrings.modify,
                  style: AppTextStyle.whiteStyle(
                      fontSize: AppFontSizes.text14,
                      fontWeight: FontWeight.bold),
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
