import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/views/pet_list/widgets/pet_item.dart';
import 'package:flutter/material.dart';

class PetListContent extends StatefulWidget {
  PetListContent({Key key}) : super(key: key);

  @override
  _PetListContentState createState() => _PetListContentState();
}

class _PetListContentState extends State<PetListContent> {
  List<Pet> _pets = [
    Pet(name: "Firulais 1", birthDay: DateTime.now()),
    Pet(name: "Firulais 2", birthDay: DateTime.now()),
    Pet(name: "Firulais 3", birthDay: DateTime.now()),
    Pet(name: "Firulais 4", birthDay: DateTime.now()),
    Pet(name: "Firulais 5", birthDay: DateTime.now()),
    Pet(name: "Firulais 6", birthDay: DateTime.now()),
    Pet(name: "Firulais 7", birthDay: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 20, left: 30, right: 10),
           itemCount: _pets.length,
           itemBuilder: (context, index) => PetItem(pet: _pets[index]));
  }
}