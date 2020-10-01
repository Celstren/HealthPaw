import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/sync_wearable/logic/sync_wearable_logic.dart';
import 'package:flutter/material.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';

class SyncWearableReportDialog extends StatefulWidget {
  final String deviceId;
  SyncWearableReportDialog(
      {Key key,
      this.deviceId = "",
      })
      : super(key: key);

  @override
  _SyncWearableReportDialogState createState() =>
      _SyncWearableReportDialogState();
}

class _SyncWearableReportDialogState extends State<SyncWearableReportDialog> {
  bool isActive = false;

  Future<void> activateRecord() async {
    setState(() {
      isActive = true;
    });
    await SyncWearableLogic.activateLogs();
    await Future.delayed(Duration(seconds: 1));
    dynamic value = await SyncWearableLogic.deactivateLogs();
    print(value);
    setState(() {
      isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildConnect();
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
                  : SizedBox(
                width: 160,
                height: 40,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
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
