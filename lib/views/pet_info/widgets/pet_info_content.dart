import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/helpers/validators.dart';
import 'package:HealthPaw/utils/widgets/app_text_field.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/select_pet_type_content.dart';
import 'package:flutter/material.dart';

class PetInfoContent extends StatefulWidget {
  final PetType petType;
  final Pet pet;
  PetInfoContent({Key key, this.petType = PetType.Dog, this.pet}) : super(key: key);

  @override
  _PetInfoContentState createState() => _PetInfoContentState();
}

class _PetInfoContentState extends State<PetInfoContent> {
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
          title: widget.pet != null ? AppStrings.successfulModify : AppStrings.successfulRegister,
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
  void initState() {
    if (widget.pet != null) {
      petNameController = TextEditingController(text: widget.pet.name);
      birthDayController = widget.pet.birthDay;
    }
    super.initState();
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
                validatedBirthDayValue = true;
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
                text: widget.pet != null ? AppStrings.modify : AppStrings.register,
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
