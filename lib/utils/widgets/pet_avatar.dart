import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_avatar.dart';
import 'package:flutter/material.dart';

class PetAvatar extends StatelessWidget {
  final String path;
  final String name;
  final double size;
  const PetAvatar({Key key, this.path = "", this.name = "", this.size = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: name != null && name.isNotEmpty ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: <Widget>[
          CircularAvatar(size: size, path: path, initialName: "A"),
          name != null && name.isNotEmpty ? SizedBox(height: 20) : SizedBox(),
          name != null && name.isNotEmpty ? Text(
            name,
            style: AppTextStyle.blackStyle(
              fontSize: AppFontSizes.subitle20,
              fontFamily: AppFonts.Montserrat_Bold,
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}
