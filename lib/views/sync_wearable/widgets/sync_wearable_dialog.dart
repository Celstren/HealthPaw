import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/sync_wearable/logic/device_controller.dart';
import 'package:HealthPaw/views/sync_wearable/logic/sync_wearable_logic.dart';
import 'package:flutter/material.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';

class SyncWearableDialog extends StatefulWidget {
  final String deviceId;
  final bool alreadyConnected;
  final Function onConnected;
  final Function onDisconnected;
  SyncWearableDialog({Key key, this.deviceId = "", this.alreadyConnected = false, this.onConnected, this.onDisconnected}) : super(key: key);

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
            onPress: () async {
              await SyncWearableLogic.connectBoard(widget.deviceId);
              setState(() {
                currentDialog = 1;
              });
              await Future.delayed(Duration(seconds: 2));
              setState(() {
                continueIsAvailable = true;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildConnecting() {
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
                  DeviceController.isConnected = true;
                  if (widget.onConnected != null) {
                    widget.onConnected();
                  }
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
                onPress: () async {
                  setState(() {
                    continueIsAvailable = false;
                  });
                  await SyncWearableLogic.connectBoard(widget.deviceId);
                  await Future.delayed(Duration(seconds: 2));
                  setState(() {
                    continueIsAvailable = true;
                  });
                },
              )
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
      height: 400,
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
                onPress: () {
                  if (widget.onDisconnected != null) {
                    widget.onDisconnected();
                  }
                  Navigator.pop(context);
                  SyncWearableLogic.disconnectBoard();
                },
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
