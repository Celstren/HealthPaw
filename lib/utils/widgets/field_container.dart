import 'package:HealthPaw/utils/general/app_colors.dart';
import 'package:HealthPaw/utils/general/app_text_styles.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextStyle hintStyle;
  final Size size;
  const TextFieldContainer({
    Key key,
    this.controller, 
    this.size, 
    this.hint = "", 
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size?.width ?? 300,
      height: size?.height ?? 50,
      decoration: BoxDecoration(
        color: AppColors.PrimaryLightBlue,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration.collapsed(
          hintText: hint,
          hintStyle: hintStyle ?? AppTextStyle.blackStyle(fontSize: 12),
        ),
      ),
    );
  }
}
