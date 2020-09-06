import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/helpers/validators.dart';
import 'package:HealthPaw/utils/widgets/app_text_field.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/select_pet_type_content.dart';
import 'package:flutter/material.dart';

class ModifyPetContent extends StatefulWidget {
  final PetType petType;
  ModifyPetContent({Key key, this.petType = PetType.Dog}) : super(key: key);

  @override
  _ModifyPetContentState createState() => _ModifyPetContentState();
}

class _ModifyPetContentState extends State<ModifyPetContent> {
  TextEditingController petNameController = TextEditingController();
  DateTime birthDayController;

  bool validatedPetNameValue = true;
  bool validatedBirthDayValue = true;

  bool get validatedPetName =>
      Validators.validString(petNameController.value.text.trim());
  bool get validatedBirthDay =>
      birthDayController != null && birthDayController.isBefore(DateTime.now());

  void showModifySuccessDialog() {
    showCustomDialog(
      context: context,
      child: CustomDialog(
        backgroundColor: Colors.transparent,
        child: OkDialog(
          title: AppStrings.successfulModify,
          okText: AppStrings.close,
          onPress: () {},
        ),
      ),
    );
  }

  void _submit() {
    if (validatedPetName && validatedBirthDay) {
      showModifySuccessDialog();
    } else {
      setState(() {
        validatedPetNameValue = validatedPetName;
        validatedBirthDayValue = validatedBirthDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          PetAvatar(),
          SizedBox(height: 20),
          AppSimpleTextField(
              title: "${AppStrings.names}:",
              controller: petNameController,
              hint: AppStrings.enterName,
              errorMsg:
                  "${AppStrings.theField} ${AppStrings.names} ${AppStrings.isInvalid}",
              isValid: validatedPetNameValue,
              onChanged: (value) {
                if (!validatedPetNameValue) {
                  setState(() {
                    validatedPetNameValue = true;
                  });
                }
              }),
          SizedBox(height: 20),
          AppDateTextField(
            title: "${AppStrings.birthDay}:",
            controller: birthDayController,
            onSelected: (_date) {
              setState(() {
                birthDayController = _date;
              });
            },
            hint: AppStrings.enterBirthday,
            isValid: validatedBirthDayValue,
            errorMsg:
                "${AppStrings.theField} ${AppStrings.birthDay} ${AppStrings.isInvalid}",
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RoundedButton(
                text: AppStrings.modify,
                size: Size(150, 40),
                style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                onPress: () => _submit(),
              ),
              RoundedButton(
                text: AppStrings.deactivate,
                size: Size(150, 40),
                style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18),
                onPress: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
