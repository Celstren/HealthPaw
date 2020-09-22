import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/recommendation.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/description_dialog.dart';
import 'package:flutter/material.dart';

class PetRecommendationItem extends StatelessWidget {
  final Recommendation recommendation;
  const PetRecommendationItem({Key key, this.recommendation}) : super(key: key);

  void displayRecommendation(BuildContext context) {
    showCustomDialog(
      context: context,
      child: CustomDialog(
        backgroundColor: Colors.transparent,
        child: DescriptionDialog(
          description: recommendation?.description ?? "",
          okText: AppStrings.ok,
          onPress: () => Navigator.pop(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 350,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius15),
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(3.0, 3.0),
              color: AppColors.PrimaryBlack.withOpacity(.25),
              blurRadius: 3.0,
              spreadRadius: 3.0)
        ],
      ),
      child: FlatButton(
        onPressed: () => displayRecommendation(context),
        child: Text(
          recommendation?.description ?? "",
          textAlign: TextAlign.justify,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.blackStyle(
              fontSize: AppFontSizes.text12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
