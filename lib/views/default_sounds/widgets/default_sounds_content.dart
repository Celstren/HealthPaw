import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/views/default_sounds/widgets/default_sounds_list.dart';
import 'package:flutter/material.dart';

class DefaultSoundsContent extends StatefulWidget {
  DefaultSoundsContent({Key key}) : super(key: key);

  @override
  _DefaultSoundsContentState createState() => _DefaultSoundsContentState();
}

class _DefaultSoundsContentState extends State<DefaultSoundsContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            PetAvatar(name: "Firulays"),
            SizedBox(height: 10),
            DefaultSoundsGrids(),
          ],
        ),
      ),
    );
  }
}
