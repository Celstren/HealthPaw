import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class OkDialog extends StatefulWidget {
  final String title;
  final String okText;
  final Function onPress;
  OkDialog({Key key, this.title = "", this.okText = "", this.onPress}) : super(key: key);

  @override
  _OkDialogState createState() => _OkDialogState();
}

class _OkDialogState extends State<OkDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius20),
        color: AppColors.PrimaryWhite,
      ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text(widget.title, style: AppTextStyle.blackStyle(fontSize: AppFontSizes.title18, fontWeight: FontWeight.w700), textAlign: TextAlign.center,),
           SizedBox(height: 20),
           RoundedButton(
             text: widget.okText,
             size: Size(160, 40),
             color: AppColors.PrimaryLightBlue,
             style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.text16, fontWeight: FontWeight.w500),
             onPress: widget.onPress,
           ),
         ],
       ),
    );
  }
}