import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_avatar.dart';
import 'package:flutter/material.dart';

class PetAvatar extends StatelessWidget {
  final String path;
  final String name;
  const PetAvatar({Key key, this.path = "", this.name = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CircularAvatar(size: 125, path: path, initialName: "A"),
          SizedBox(height: 20),
          Text(
            name,
            style: AppTextStyle.blackStyle(
              fontSize: AppFontSizes.subitle20,
              fontFamily: AppFonts.Montserrat_Bold,
            ),
          ),
        ],
      ),
    );
  }
}
