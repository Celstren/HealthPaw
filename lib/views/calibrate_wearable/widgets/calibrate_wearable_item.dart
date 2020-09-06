import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class CalibrateWearableItem extends StatelessWidget {
  final String deviceName;
  final bool calibrate;
  const CalibrateWearableItem({Key key, this.deviceName = "", this.calibrate = true})
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
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.signal_cellular_4_bar, size: 30)),
                  RoundedButton(
                    text: AppStrings.calibrate,
                    size: Size(100, 30),
                    color: this.calibrate ? AppColors.PrimaryLightBlue : AppColors.PrimaryDarkGrey,
                    style: AppTextStyle.whiteStyle(
                        fontSize: AppFontSizes.text16,
                        fontFamily: AppFonts.Montserrat_Bold),
                    onPress: () {},
                  )
                ],
              )),
        ],
      ),
    );
  }
}
