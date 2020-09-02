import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class SyncWearableItem extends StatelessWidget {
  final String deviceName;
  const SyncWearableItem({Key key, this.deviceName = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
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
                  deviceName,
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
    );
  }
}
