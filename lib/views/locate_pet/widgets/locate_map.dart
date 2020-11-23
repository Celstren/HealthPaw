import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class LocateMap extends StatelessWidget {
  final String name;
  const LocateMap({Key key, this.name = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 230,
            width: 280,
            child: Container(
              child: Image.asset('assets/icons/map-locate.png'),
              margin: EdgeInsets.all(1.0),
              padding: EdgeInsets.all(1.0),
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 350,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.PrimaryLightBlue,
              border: Border.all(color: AppColors.PrimaryDarkGrey, width: 2.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${AppStrings.locationOf} $name ${AppStrings.isLabel}:", style: AppTextStyle.blackStyle(fontSize: AppFontSizes.text14)),
                Text("Localizacion es todavia no capturada", style: AppTextStyle.blackStyle(fontSize: AppFontSizes.text14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}