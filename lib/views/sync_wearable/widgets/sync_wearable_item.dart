import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/views/sync_wearable/logic/device_controller.dart';
import 'package:HealthPaw/views/sync_wearable/widgets/sync_wearable_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../../utils/widgets/custom_dialog.dart';

class SyncWearableItem extends StatefulWidget {
  final ScanResult scanResult;
  final Function(String) onConnected;
  final bool enabled;
  SyncWearableItem(
      {Key key, this.scanResult, this.onConnected, this.enabled = true})
      : super(key: key);

  @override
  _SynWearableItemState createState() => _SynWearableItemState();
}

class _SynWearableItemState extends State<SyncWearableItem> {
  void displayRecordLogsDialog() {
    showCustomDialog(
      context: context,
      builder: (context) => CustomDialog(
        child: SyncWearableDialog(
          deviceId: widget.scanResult.device.id.id,
          alreadyConnected:
              DeviceController.deviceId == widget.scanResult.device.id.id,
          onConnected: () {
            setState(() {});
          },
          onDisconnected: () {
            setState(() {});
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildSyncWearableItem();
  }

  Widget _buildSyncWearableItem() {
    return SizedBox(
      height: 70,
      child: FlatButton(
        onPressed: displayRecordLogsDialog,
        child: Material(
          color: DeviceController.deviceId == widget.scanResult.device.id.id
              ? AppColors.PrimaryGreen
              : AppColors.PrimaryWhite,
          child: Row(
            children: <Widget>[
              SizedBox(
                  width: 70,
                  height: 50,
                  child: Icon(Icons.device_hub, size: 40)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      widget.scanResult.device.name,
                      style: AppTextStyle.blackStyle(
                        fontSize: AppFontSizes.text14,
                        fontFamily: AppFonts.Montserrat_Bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Icon(Icons.signal_cellular_4_bar, size: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
