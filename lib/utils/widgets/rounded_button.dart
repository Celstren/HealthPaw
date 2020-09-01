import 'package:HealthPaw/utils/general/app_colors.dart';
import 'package:HealthPaw/utils/general/app_text_styles.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color;
  final TextStyle style;
  final Size size;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = AppColors.PrimaryLightBlue,
    this.style, 
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?.height ?? 50,
      width: size?.width ?? 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: style ?? AppTextStyle.blackStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
