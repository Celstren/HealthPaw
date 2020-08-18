import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.healthPaw),
      ),
      body: Container(
        child: Center(
          child: Text(AppStrings.healthPaw),
        ),
      ),
    );
  }
}