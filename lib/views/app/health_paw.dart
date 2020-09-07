import 'package:HealthPaw/config/app_config.dart';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/views/auth/login/login.dart';
import 'package:HealthPaw/views/test_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      view = LoginView();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: AppStrings.healthPaw,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TestView(),
    );
  }
}
