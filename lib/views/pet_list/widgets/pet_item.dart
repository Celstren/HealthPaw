import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/views/pet_info/pet_info.dart';
import 'package:flutter/material.dart';

class PetItem extends StatelessWidget {
  final Pet pet;
  const PetItem({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.PrimaryWhite,
        borderRadius: AppBorderRadius.all(radius: AppRadius.radius15),
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(3.0, 3.0),
              color: AppColors.PrimaryBlack.withOpacity(.25),
              blurRadius: 5.0,
              spreadRadius: 5.0)
        ],
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, right: 30),
            child: PetAvatar(size: 60),
          ),
          Expanded(
            child: Text(
              pet?.namevar ?? "",
              style: AppTextStyle.blackStyle(
                  fontSize: AppFontSizes.subitle18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PetInfoView(pet: pet))),
                child: Center(
                    child: Icon(Icons.edit,
                        size: 30, color: AppColors.PrimaryBlack))),
          )
        ],
      ),
    );
  }
}
