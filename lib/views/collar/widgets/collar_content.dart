import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class CollarContent extends StatefulWidget {
  CollarContent({Key key}) : super(key: key);

  @override
  _CollarContentState createState() => _CollarContentState();
}

class _CollarContentState extends State<CollarContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.synchronize,
           icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
         ),
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.calibrate,
           icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
         ),
       ],
    );
  }
}