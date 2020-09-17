import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/services.dart';

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
  static const platform =
      const MethodChannel('com.example.HealthPaw/mbientlab');
  bool expanded = false;

  Future<void> _connectBoard() async {
    try {
      await platform
          .invokeMethod('connectBoard', {"boardId": widget.scanResult.device.id.id});
    } on PlatformException catch (e) {
      print("Fail to connect: $e");
    }
  }

  Future<void> _turnOffLed() async {
    try {
      await platform.invokeMethod('turnOffLed');
    } on PlatformException catch (e) {
      print("Fail to turn off: $e");
    }
  }

  Future<void> _turnOnLed() async {
    try {
      await platform.invokeMethod('turnOnLed', {"colorId": 0});
    } on PlatformException catch (e) {
      print("Fail to turn on: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return expanded
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildSyncWearableItem(),
              _buildSyncWearableOptions(),
            ],
          )
        : _buildSyncWearableItem();
  }

  Widget _buildSyncWearableItem() {
    return SizedBox(
      height: 70,
      child: GestureDetector(
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: Row(
          children: <Widget>[
            SizedBox(
                width: 70, height: 50, child: Icon(Icons.device_hub, size: 40)),
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
    );
  }

  Widget _buildSyncWearableOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.PrimaryBlack)
          ),
          height: 40,
          child: GestureDetector(
            onTap: _connectBoard,
            child: Center(
              child: Text(
                AppStrings.connect,
                style: AppTextStyle.blackStyle(
                  fontSize: AppFontSizes.text14,
                  fontFamily: AppFonts.Montserrat_Bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.PrimaryBlack)
          ),
          height: 40,
          child: GestureDetector(
            child: Center(
              child: Text(
                "Prender LED",
                style: AppTextStyle.blackStyle(
                  fontSize: AppFontSizes.text14,
                  fontFamily: AppFonts.Montserrat_Bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.PrimaryBlack)
          ),
          height: 40,
          child: GestureDetector(
            child: Center(
              child: Text(
                "Apagar LED",
                style: AppTextStyle.blackStyle(
                  fontSize: AppFontSizes.text14,
                  fontFamily: AppFonts.Montserrat_Bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
