import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/views/pet_list/widgets/pet_item.dart';
import 'package:flutter/material.dart';

class PetListContent extends StatefulWidget {
  PetListContent({Key key}) : super(key: key);

  @override
  _PetListContentState createState() => _PetListContentState();
}

class _PetListContentState extends State<PetListContent> {
  List<Pet> _pets = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    User user = await Preferences.getUser;
    if (user != null && user.pets != null) {
      setState(() {
        _pets = user.pets.map<Pet>((e) => e.toPet).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 20, left: 30, right: 10),
           itemCount: _pets.length,
           itemBuilder: (context, index) => PetItem(pet: _pets[index]));
  }
}