import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/services/pet/pet.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/report_pet_status/widgets/prev_set_breathing.dart';
import 'package:HealthPaw/views/report_pet_status/widgets/prev_set_heart_rate.dart';
import 'package:HealthPaw/views/sync_wearable/logic/device_controller.dart';
import 'package:HealthPaw/views/sync_wearable/sync_wearable.dart';
import 'package:HealthPaw/views/sync_wearable/widgets/sync_wearable_report_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectPetStatusReportContent extends StatefulWidget {
  final Pet pet;
  SelectPetStatusReportContent({Key key, this.pet}) : super(key: key);

  @override
  _SelectPetStatusReportContentState createState() =>
      _SelectPetStatusReportContentState();
}

class _SelectPetStatusReportContentState
    extends State<SelectPetStatusReportContent> {
  double divisionSize = 30;

  num breathingFrequency = 0;
  num heartRate = 0;
  SharedPreferences sharedPrefs;
  
  void loadValues() {    
    final breathingValue = sharedPrefs.getInt("breathing_key") ?? 0;
    final heartrateValue = sharedPrefs.getInt("heartrate_key") ?? 0;
    breathingFrequency = breathingValue;
    heartRate = heartrateValue;
  }

  @override
  Widget build(BuildContext context) { 
    SharedPreferences.getInstance().then((prefs) { setState(() => sharedPrefs = prefs); }); // sharedPrefs
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            _buildOptionsButtons(),            
            Container(
              child: Image.asset('assets/tutorials/both.jpeg'),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
            ),
            _buildReportButton(),
            SizedBox(height: 30),            
            _buildReportWithSensorButton(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }

  void reportStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final breathingValue = prefs.getInt("breathing_key") ?? 0;
    final heartrateValue = prefs.getInt("heartrate_key") ?? 0;
    breathingFrequency = breathingValue;
    heartRate = heartrateValue;

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
            },
          ),
        ),
      );
    }
  }

  Widget _buildOptionsButtons() {
    loadValues(); // update strings on rebuild
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          SizedBox(height: divisionSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircularButton(
                size: 80,
                onPress: () =>
                    // redirect to set heart rate
                    NavigationMethods.of(context).navigateTo(PrevSetHeartrate()),
                label: AppStrings.cardiacFrequency,
                icon: Icon(Icons.favorite,
                    size: 30, color: AppColors.PrimaryBlack),
              ),
              CircularButton(
                size: 80,
                onPress: () =>
                    // redirect to set breathing freq
                    NavigationMethods.of(context).navigateTo(PrevSetBreathing()),
                label: AppStrings.breathFrequency,
                icon:
                    Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('\u{2665}: ' + heartRate.toString()),
              Text('\u{23F1}: ' + breathingFrequency.toString())
            ],
          ),
          SizedBox(height: divisionSize)
        ],
      ),
    );
  }

  Widget _buildReportButton() {
    return RoundedButton(
      text: AppStrings.reportStatus,
      size: Size(200, 50),
      color: AppColors.PrimaryLightBlue,
      style: AppTextStyle.whiteStyle(
          fontSize: AppFontSizes.text14, fontFamily: AppFonts.Montserrat_Bold),
      onPress: reportStatus,
    );
  }

  Widget _buildReportWithSensorButton() {
    return RoundedButton(
      text: AppStrings.reportStatusWithSensor,
      size: Size(200, 50),
      style: AppTextStyle.whiteStyle(
          fontSize: AppFontSizes.text14, fontFamily: AppFonts.Montserrat_Bold),
      onPress: () {
        if (DeviceController.isConnectedValue) {
          showCustomDialog(
              context: context,
              builder: (context) => CustomDialog(
                  child: SyncWearableReportDialog(pet: widget.pet)));
        } else {
          showCustomDialog(
            context: context,
            builder: (context) => CustomDialog(
              child: OkDialog(
                title: AppStrings.sensorIsNotConnected,
                okText: AppStrings.syncDevice,
                onPress: () {
                  Navigator.pop(context);
                  NavigationMethods.of(context).navigateTo(SyncWearableView());
                },
              ),
            ),
          );
        }
      },
    );
  }
}
