import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class SetPetBreathing extends StatefulWidget {
  SetPetBreathing({Key key}) : super(key: key);

  @override
  _SetPetHeartRateState createState() => _SetPetHeartRateState();
}

class _SetPetHeartRateState extends State<SetPetBreathing> {
  num breathingFrequency = 0;

  void saveBreathing() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'breathing_key';
    final value = breathingFrequency;    
    prefs.setInt(key, value);
    print('se guardó frecuencia respiratoria a: $value');

    showCustomDialog(
      context: context,
      child: CustomDialog(
        backgroundColor: Colors.transparent,
        child: OkDialog(
          title: AppStrings.breathFrequency + " guardada",
          okText: AppStrings.close,
          onPress: () {              
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              CommonAppBar(title: AppStrings.breathFrequency, showHeader: true),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    _buildBreathingStatfield(),
                    SizedBox(height: 30),
                    _buildReportButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
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
      text: "Registrar " + AppStrings.breathFrequency,
      size: Size(200, 50),
      color: AppColors.PrimaryLightBlue,
      style: AppTextStyle.whiteStyle(
          fontSize: AppFontSizes.text14, fontFamily: AppFonts.Montserrat_Bold),
      onPress: saveBreathing,
    );
  }


}