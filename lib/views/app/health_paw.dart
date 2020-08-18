import 'package:HealthPaw/config/app_config.dart';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/views/home/home_view.dart';
import 'package:flutter/material.dart';

class HealthPawApp extends StatefulWidget {
  HealthPawApp({Key key}) : super(key: key);

  @override
  _HealthPawAppState createState() => _HealthPawAppState();
}

class _HealthPawAppState extends State<HealthPawApp> {

  Widget view = Scaffold();

  @override
  void initState() {
    initializeConfig();
    super.initState();
  }

  void initializeConfig() async {
    await AppConfig.setAppLanguage();
    setState(() {
      view = HomeView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: AppStrings.healthPaw,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: view,
    );
  }
}