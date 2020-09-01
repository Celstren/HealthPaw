import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:flutter/material.dart';

class OwnerContent extends StatefulWidget {
  OwnerContent({Key key}) : super(key: key);

  @override
  _OwnerContentState createState() => _OwnerContentState();
}

class _OwnerContentState extends State<OwnerContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.pets,
           icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
         ),
         CircularButton(
           size: 80,
           press: () {},
           label: AppStrings.collars,
           icon: Icon(Icons.timer, size: 30, color: AppColors.PrimaryBlack),
         ),
       ],
    );
  }
}