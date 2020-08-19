import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:flutter/material.dart';

class LoginTop extends StatelessWidget {
  const LoginTop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.PrimaryLightBlue,
                borderRadius: AppBorderRadius.onlyBottom(bottomRadius: AppBorderRadius.radius15),
              ),
              padding: EdgeInsets.only(left: 30),
              child: Align(alignment: Alignment.centerLeft, child: Text(AppStrings.login, style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title24, fontFamily: AppFonts.Montserrat_Black))),
            );
  }
}