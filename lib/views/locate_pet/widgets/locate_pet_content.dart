import 'package:HealthPaw/utils/widgets/pet_avatar.dart';
import 'package:HealthPaw/views/locate_pet/widgets/locate_map.dart';
import 'package:flutter/material.dart';

class LocatePetContent extends StatefulWidget {
  LocatePetContent({Key key}) : super(key: key);

  @override
  _LocatePetContentState createState() => _LocatePetContentState();
}

class _LocatePetContentState extends State<LocatePetContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           SizedBox(height: 20),
           PetAvatar(name: "Firulays"),
           SizedBox(height: 20),
           LocateMap(name: "Firulays"),
         ],
       ),
    );
  }
}