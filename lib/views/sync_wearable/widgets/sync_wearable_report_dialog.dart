import 'dart:async';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/accelerometer.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/models/pet/stadistic.dart';
import 'package:HealthPaw/models/pet/temperature.dart';
import 'package:HealthPaw/services/pet/pet.dart';
import 'package:HealthPaw/utils/widgets/loading_screen.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/sync_wearable/logic/sync_wearable_logic.dart';
import 'package:flutter/material.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:intl/intl.dart';

class SyncWearableReportDialog extends StatefulWidget {
  final String deviceId;
  final Pet pet;
  SyncWearableReportDialog({
    Key key,
    this.deviceId = "",
    this.pet,
  }) : super(key: key);

  @override
  _SyncWearableReportDialogState createState() =>
      _SyncWearableReportDialogState();
}

class _SyncWearableReportDialogState extends State<SyncWearableReportDialog> {
  bool isActive = false, forceStop = false;
  List<Temperature> temperatures = [];
  List<Acceleration> accelerations = [];
  Timer timer;

  static final String clase = "SyncWearableReportDialog";

  @override
  void initState() { 
    super.initState();
    print(clase);
  }

  Future<void> activateRecord() async {
    setState(() {
      isActive = true;
    });
    await SyncWearableLogic.activateLogs();
    timer = new Timer(Duration(minutes: 1), () async {
      await deactivateRecord();
    });
  }

  Future<void> deactivateRecord() async {
    dynamic value = await SyncWearableLogic.deactivateLogs();

    setState(() {
      temperatures = value["temperature"]
              ?.map<Temperature>(
                  (e) => Temperature.fromJson(Map<String, dynamic>.from(e)))
              ?.toList() ??
          [];
      accelerations = value["accelerations"]
              ?.map<Acceleration>(
                  (e) => Acceleration.fromJson(Map<String, dynamic>.from(e)))
              ?.toList() ??
          [];
      isActive = false;
    });
  }

  Future<void> reportStatus() async {
    displayLoadingScreen(context);
    final Pet updatedPet = widget.pet;
    List<History> tempHistories = temperatures.map<History>((e) => e.toHistory()).toList();
    List<History> todayTempHistoryValues = tempHistories.where((element) => DateTime.fromMillisecondsSinceEpoch(element.timestamp).difference(DateTime.now()).inDays == 0).toList();
    
    List<History> accelHistories = accelerations.map<History>((e) => e.toHistory()).toList();
    List<History> todayAccelHistoryValues = accelHistories.where((element) => DateTime.fromMicrosecondsSinceEpoch(element.timestamp).difference(DateTime.now()).inDays == 0).toList();

    updatedPet.temperature.history.addAll(tempHistories);
    updatedPet.temperature.todayHistory.addAll(todayTempHistoryValues);

    updatedPet.physicalActivity.history.addAll(accelHistories);
    updatedPet.physicalActivity.todayHistory.addAll(todayAccelHistoryValues);

    print("Test");

    await PetService.updatePet(updatedPet);

    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildConnect();
  }

  Widget _buildConnect() {
    return Container(
      height: 200 +
          (temperatures.isNotEmpty && accelerations.isNotEmpty ? 300.0 : 0.0),
      width: 360,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius20),
        color: AppColors.PrimaryWhite,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Icon(Icons.receipt, size: 60),
              ),
              !isActive
                  ? RoundedButton(
                      text: AppStrings.start,
                      size: Size(160, 40),
                      color: AppColors.PrimaryLightBlue,
                      style: AppTextStyle.whiteStyle(
                          fontSize: AppFontSizes.text16,
                          fontWeight: FontWeight.w500),
                      onPress: () async => await activateRecord(),
                    )
                  : RoundedButton(
                      text: AppStrings.stop,
                      size: Size(160, 40),
                      color: AppColors.PrimaryLightBlue,
                      style: AppTextStyle.whiteStyle(
                          fontSize: AppFontSizes.text16,
                          fontWeight: FontWeight.w500),
                      onPress: () async {
                        timer?.cancel();
                        await deactivateRecord();
                      },
                    ),
              !isActive
                  ? SizedBox()
                  : SizedBox(
                      width: 160,
                      height: 40,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              temperatures.isNotEmpty && accelerations.isNotEmpty
                  ? SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _buildTemperatureLogs(),
                          _buildAccelerationsLogs(),
                        ],
                      ),
                    )
                  : SizedBox(),
              temperatures.isNotEmpty && accelerations.isNotEmpty
                  ? RoundedButton(
                      text: AppStrings.reportStatus,
                      size: Size(160, 40),
                      color: AppColors.PrimaryLightBlue,
                      style: AppTextStyle.whiteStyle(
                          fontSize: AppFontSizes.text16,
                          fontWeight: FontWeight.w500),
                      onPress: () async => await reportStatus(),
                    )
                  : SizedBox(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 80,
                height: 50,
                child: FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 35,
                        color: AppColors.PrimaryBlack,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTemperatureLogs() {
    return SizedBox(
      height: 150,
      width: 120,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(AppStrings.temperaturesTrack,
                style: AppTextStyle.blackStyle(fontSize: AppFontSizes.text14)),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: temperatures.length,
            itemBuilder: (context, int index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  "${DateFormat("yyyy/MM/dd HH:mm aaa").format(DateTime.fromMillisecondsSinceEpoch(temperatures[index].timestamp))}\n${temperatures[index].celsius} ${AppStrings.temperatureUnits}",
                  style:
                      AppTextStyle.blackStyle(fontSize: AppFontSizes.text10)),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildAccelerationsLogs() {
    return SizedBox(
      height: 150,
      width: 120,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(AppStrings.physicalActivitiesTrack,
                style: AppTextStyle.blackStyle(fontSize: AppFontSizes.text14)),
          ),
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.only(bottom: 10),
            itemCount: accelerations.length,
            itemBuilder: (context, int index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  "${DateFormat("yyyy/MM/dd HH:mm aaa").format(DateTime.fromMillisecondsSinceEpoch(accelerations[index].timestamp))}\n${accelerations[index].value.toStringAsFixed(3)}",
                  style:
                      AppTextStyle.blackStyle(fontSize: AppFontSizes.text10)),
            ),
          ))
        ],
      ),
    );
  }
}
