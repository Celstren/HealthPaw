import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/services/pet/pet.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class ReportPetStatusContent extends StatefulWidget {
  final Pet pet;
  ReportPetStatusContent({Key key, this.pet}) : super(key: key);

  @override
  _ReportPetStatusContentState createState() => _ReportPetStatusContentState();
}

class _ReportPetStatusContentState extends State<ReportPetStatusContent> {
  num breathingFrequency = 0;
  num heartRate = 0;

  void reportStatus() async {
    bool success = await PetService.reportStatus(
        widget.pet.id, breathingFrequency, heartRate);
    if (success) {
      showCustomDialog(
        context: context,
        child: CustomDialog(
          backgroundColor: Colors.transparent,
          child: OkDialog(
            title: AppStrings.successfulReport,
            okText: AppStrings.close,
            onPress: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          _buildCardiacStatfield(),
          SizedBox(height: 30),
          _buildBreathingStatfield(),
          SizedBox(height: 30),
          _buildReportButton(),
        ],
      ),
    );
  }

  Widget _buildCardiacStatfield() {
    num cents = heartRate - (heartRate % 100);
    num tens = heartRate - cents - (heartRate % 10);
    num units = (heartRate % 10);

    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 30),
              Text(AppStrings.cardiacFrequency + ":",
                  style:
                      AppTextStyle.blackStyle(fontSize: AppFontSizes.title16)),
              SizedBox(width: 10),
              Text(heartRate.toString(),
                  style:
                      AppTextStyle.blackStyle(fontSize: AppFontSizes.title16)),
            ],
          ),
          SizedBox(height: 30),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new WheelChooser.integer(
                    initValue: 0,
                    minValue: 0,
                    maxValue: 9,
                    listHeight: 100,
                    listWidth: 50,
                    isInfinite: true,
                    onValueChanged: (digit) {
                      print(digit);
                      setState(() {
                        heartRate = digit * 100 + tens + units;
                      });
                    }),
                new WheelChooser.integer(
                    initValue: 0,
                    minValue: 0,
                    maxValue: 9,
                    listHeight: 100,
                    listWidth: 50,
                    isInfinite: true,
                    onValueChanged: (digit) {
                      print(digit);
                      setState(() {
                        heartRate = cents + digit * 10 + units;
                      });
                    }),
                new WheelChooser.integer(
                    initValue: 0,
                    minValue: 0,
                    maxValue: 9,
                    listHeight: 100,
                    listWidth: 50,
                    isInfinite: true,
                    onValueChanged: (digit) {
                      print(digit);
                      setState(() {
                        heartRate = cents + tens + digit;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreathingStatfield() {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 30),
              Text(AppStrings.breathFrequency + ":",
                  style:
                      AppTextStyle.blackStyle(fontSize: AppFontSizes.title16)),
              SizedBox(width: 10),
              Text(breathingFrequency.toString(),
                  style:
                      AppTextStyle.blackStyle(fontSize: AppFontSizes.title16)),
            ],
          ),
          SizedBox(height: 30),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new WheelChooser.integer(
                    initValue: 0,
                    minValue: 0,
                    maxValue: 9,
                    listHeight: 100,
                    listWidth: 50,
                    isInfinite: true,
                    onValueChanged: (digit) {
                      setState(() {
                        num units = breathingFrequency % 10;
                        breathingFrequency = digit * 10 + units;
                      });
                    }),
                new WheelChooser.integer(
                    initValue: 0,
                    minValue: 0,
                    maxValue: 9,
                    listHeight: 100,
                    listWidth: 50,
                    isInfinite: true,
                    onValueChanged: (digit) {
                      setState(() {
                        num tens =
                            breathingFrequency - (breathingFrequency % 10);
                        breathingFrequency = tens + digit;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportButton() {
    return RoundedButton(
      text: AppStrings.reportStatus,
      size: Size(160, 40),
      color: AppColors.PrimaryLightBlue,
      style: AppTextStyle.whiteStyle(
          fontSize: AppFontSizes.text16, fontWeight: FontWeight.w500),
      onPress: reportStatus,
    );
  }
}
