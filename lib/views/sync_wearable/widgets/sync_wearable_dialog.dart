import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/sync_wearable/logic/sync_wearable_logic.dart';
import 'package:flutter/material.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SyncWearableDialog extends StatefulWidget {
  final String deviceId;
  final bool alreadyConnected;
  SyncWearableDialog({
    Key key,
    this.deviceId = "",
    this.alreadyConnected = false,
  }) : super(key: key);

  @override
  _SyncWearableDialogState createState() => _SyncWearableDialogState();
}

class _SyncWearableDialogState extends State<SyncWearableDialog> {
  int currentDialog = 0;
  bool continueIsAvailable = false;

  @override
  void initState() {
    if (widget.alreadyConnected) {
      currentDialog = 2;
    }
    super.initState();
  }

  void connectToSensor() async {
    setState(() {
      currentDialog = 1;
    });
    await SyncWearableLogic.connectBoard(widget.deviceId);
    setState(() {
      continueIsAvailable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (currentDialog) {
      case 0:
        return _buildConnect();
        break;
      case 1:
        return _buildConnecting();
        break;
      case 2:
        return _buildOptions();
        break;
    }
    return Container();
  }

  Widget _buildConnect() {
    return Container(
      height: 200,
      width: 360,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius20),
        color: AppColors.PrimaryWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Icon(Icons.device_hub, size: 60),
          ),
          RoundedButton(
            text: AppStrings.connect,
            size: Size(160, 40),
            color: AppColors.PrimaryLightBlue,
            style: AppTextStyle.whiteStyle(
                fontSize: AppFontSizes.text16, fontWeight: FontWeight.w500),
            onPress: connectToSensor,
          ),
        ],
      ),
    );
  }

  Widget _buildConnecting() {
    return Container(
      height: 220,
      width: 360,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius20),
        color: AppColors.PrimaryWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text(
              AppStrings.waitUntilConnect + "...",
              style: AppTextStyle.blackStyle(
                  fontSize: AppFontSizes.title18, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          continueIsAvailable
              ? Column(
                  children: <Widget>[
                    RoundedButton(
                      text: AppStrings.continueLabel,
                      size: Size(160, 40),
                      color: AppColors.PrimaryLightBlue,
                      style: AppTextStyle.whiteStyle(
                          fontSize: AppFontSizes.text16,
                          fontWeight: FontWeight.w500),
                      onPress: () {
                        setState(() {
                          currentDialog = 2;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    RoundedButton(
                      text: AppStrings.retry,
                      size: Size(160, 40),
                      color: AppColors.PrimaryLightBlue,
                      style: AppTextStyle.whiteStyle(
                          fontSize: AppFontSizes.text16,
                          fontWeight: FontWeight.w500),
                      onPress: connectToSensor,
                    ),
                    SizedBox(height: 20),
                  ],
                )
              : SizedBox(
                  height: 40,
                  width: 160,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Container(
      height: 420,
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
                child: Text(
                  AppStrings.connected + "!",
                  style: AppTextStyle.blackStyle(
                      fontSize: AppFontSizes.title18,
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              RoundedButton(
                text: AppStrings.disconnect,
                size: Size(160, 40),
                color: AppColors.PrimaryLightBlue,
                style: AppTextStyle.whiteStyle(
                    fontSize: AppFontSizes.text16, fontWeight: FontWeight.w500),
                onPress: () async {
                  bool success = await SyncWearableLogic.disconnectBoard();
                  if (success) {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: AppStrings.sensorDisconnectedSuccessfully);
                  }
                  Fluttertoast.showToast(
                      msg: AppStrings.sensorDisconnectedFailed);
                },
              ),
              RoundedButton(
                text: AppStrings.retry,
                size: Size(160, 40),
                color: AppColors.PrimaryLightBlue,
                style: AppTextStyle.whiteStyle(
                    fontSize: AppFontSizes.text16, fontWeight: FontWeight.w500),
                onPress: connectToSensor,
              ),
              RoundedButton(
                text: AppStrings.turnOnLed,
                size: Size(160, 40),
                color: AppColors.PrimaryLightBlue,
                style: AppTextStyle.whiteStyle(
                    fontSize: AppFontSizes.text16, fontWeight: FontWeight.w500),
                onPress: SyncWearableLogic.turnOnLed,
              ),
              RoundedButton(
                text: AppStrings.turnOffLed,
                size: Size(160, 40),
                color: AppColors.PrimaryLightBlue,
                style: AppTextStyle.whiteStyle(
                    fontSize: AppFontSizes.text16, fontWeight: FontWeight.w500),
                onPress: SyncWearableLogic.turnOffLed,
              ),
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
}
