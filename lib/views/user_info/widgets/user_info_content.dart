import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/overview_field.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInfoContent extends StatefulWidget {
  final UserType userType;
  final User user;
  UserInfoContent({Key key, this.userType = UserType.Owner, this.user})
      : super(key: key);

  @override
  _UserInfoContentState createState() => _UserInfoContentState();
}

class _UserInfoContentState extends State<UserInfoContent> {
  void _submit() async {
    // if (validatedUserName && validatedBirthDay) {
    //   displayLoadingScreen(context);
    //   if (widget.user != null) {
    //     bool success = await modifyPetRequest();
    //     Navigator.pop(context);
    //     if (success) {
    //       showModifySuccessDialog();
    //     } else {
    //       showModifyFailDialog();
    //     }
    //     return;
    //   } else if (await createPetRequest()) {
    //     Navigator.pop(context);
    //     showModifySuccessDialog();
    //     return;
    //   }
    // } else {
    //   setState(() {
    //     validatedUserNameValue = validatedUserName;
    //     validatedBirthDayValue = validatedBirthDay;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            OverviewField(label: AppStrings.names, text: widget.user.name),
            SizedBox(height: 20),
            OverviewField(
                label: AppStrings.lastnames, text: widget.user.lastName),
            SizedBox(height: 20),
            OverviewField(
                label: AppStrings.username, text: widget.user.username),
            SizedBox(height: 20),
            OverviewField(
                label: AppStrings.mobileNumber,
                text: widget.user.phone.toString()),
            SizedBox(height: 20),
            OverviewField(
                label: AppStrings.birthDay,
                text: DateFormat("dd/MM/yyyy").format(widget.user.birthDay)),
            SizedBox(height: 20),
            OverviewField(label: AppStrings.email, text: widget.user.email),
            SizedBox(height: 20),
            OverviewField(
                label: AppStrings.status, text: widget.user.userStatus),
            SizedBox(height: 20),
            widget.userType == UserType.Vet? _vetButtons() : SizedBox(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _vetButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RoundedButton(
          text: AppStrings.assignOwner,
          size: Size(150, 40),
          style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text14),
          onPress: () => _submit(),
        ),
        RoundedButton(
          text: AppStrings.ownerAssigned,
          size: Size(150, 40),
          style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text14),
          onPress: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
