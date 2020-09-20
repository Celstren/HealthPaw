import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/services/pet/pet.dart';
import 'package:HealthPaw/services/user/user.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/constant_methods_helper.dart';
import 'package:HealthPaw/utils/helpers/validators.dart';
import 'package:HealthPaw/utils/widgets/app_text_field.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/global_dialogs.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/main_menu/main_menu.dart';
import 'package:HealthPaw/views/pet_info/widgets/pet_recommendation_item.dart';
import 'package:HealthPaw/views/pet_status/pet_status.dart';
import 'package:HealthPaw/views/report_pet_status/report_pet_status_view.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/select_pet_type_content.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PetInfoContent extends StatefulWidget {
  final PetType petType;
  final Pet pet;
  PetInfoContent({Key key, this.petType = PetType.Dog, this.pet})
      : super(key: key);

  @override
  _PetInfoContentState createState() => _PetInfoContentState();
}

class _PetInfoContentState extends State<PetInfoContent> {
  TextEditingController petNameController = TextEditingController();
  DateTime birthDayController;

  User user;

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
          title: widget.pet != null
              ? AppStrings.successfulModify
              : AppStrings.successfulRegister,
          okText: AppStrings.close,
          onPress: () => NavigationMethods.of(context)
              .navigateAndRemoveUntil(MainMenuView()),
        ),
      ),
    );
  }

  void validateRedirection(Widget widget) async {
    ConnectivityResult connectivity =
        await (Connectivity().checkConnectivity());
    if (connectivity != ConnectivityResult.none) {
      NavigationMethods.of(context).navigateTo(widget);
    } else {
      GlobalDialogs.displayConnectionError();
    }
  }

  void _submit() async {
    if (validatedPetName && validatedBirthDay) {
      if (widget.pet != null) {
        bool success = await modifyPetRequest();
        if (success) {
          showModifySuccessDialog();
        }
        return;
      } else if (await createPetRequest()) {
        Navigator.pop(context);
        showModifySuccessDialog();
        return;
      }
    } else {
      setState(() {
        validatedPetNameValue = validatedPetName;
        validatedBirthDayValue = validatedBirthDay;
      });
    }
  }

  Future<bool> createPetRequest() async {
    Pet pet = Pet(
        namevar: petNameController.value.text.trim(),
        birthDay: birthDayController,
        petType: ConstantMethodHelper.petTypeValue(widget.petType),
        );
    String id = await PetService.registerPet(pet);
    if (id != null) {
      return await UserService.addPetToUser(
          user.documentNumber, pet.namevar, id);
    } else
      return false;
  }

  Future<bool> modifyPetRequest() async {
    Pet pet = widget.pet;
    pet.namevar = petNameController.value.text.trim();
    pet.birthDay = birthDayController;
    bool success = await PetService.updatePet(pet);
    if (!success) return false;
    return await UserService.editPetToUser(
        user.documentNumber, pet.namevar, pet.id);
  }

  @override
  void initState() {
    if (widget.pet != null) {
      petNameController = TextEditingController(text: widget.pet.namevar);
      birthDayController = widget.pet.birthDay;
    }
    user = Preferences.getUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.pet != null ? _buildModifyPet() : _buildCreatePet(),
    );
  }

  Widget _buildCreatePet() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        PetAvatar(),
        SizedBox(height: 20),
        AppSimpleTextField(
            title: "${AppStrings.names}:",
            controller: petNameController,
            hint: AppStrings.enterName,
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedButton(
              text: AppStrings.register,
              size: Size(150, 40),
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text14),
              onPress: () => _submit(),
            )
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildModifyPet() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        PetAvatar(),
        SizedBox(height: 20),
        AppSimpleTextField(
            title: "${AppStrings.names}:",
            controller: petNameController,
            hint: AppStrings.enterName,
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
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
              text: AppStrings.modify,
              size: Size(150, 40),
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text14),
              onPress: () => _submit(),
            ),
            RoundedButton(
              text: AppStrings.deactivate,
              size: Size(150, 40),
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text14),
              onPress: () => Navigator.pop(context),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundedButton(
              text: AppStrings.status,
              size: Size(150, 40),
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text14),
              onPress: () {
                validateRedirection(PetStatusView(pet: widget.pet));
              },
            ),
            RoundedButton(
              text: AppStrings.reportStatus,
              size: Size(150, 40),
              style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text14),
              onPress: () => validateRedirection(ReportPetStatusView(pet: widget.pet)),
            ),
          ],
        ),
        widget.pet?.recommendations != null &&
                widget.pet.recommendations.isNotEmpty
            ? _buildRecommendations()
            : SizedBox(),
      ],
    );
  }

  Widget _buildRecommendations() {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Center(
            child: Text(
              AppStrings.recommendations,
              style: AppTextStyle.blackStyle(fontSize: AppFontSizes.title18),
            ),
          ),
        ),
        Column(
            children: widget.pet.recommendations
                .map((e) => PetRecommendationItem(recommendation: e))
                .toList()),
      ],
    );
  }
}
