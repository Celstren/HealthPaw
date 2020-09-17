import 'package:HealthPaw/config/app_config.dart';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/user/user.dart';
import 'package:HealthPaw/views/auth/login/login.dart';
import 'package:HealthPaw/views/main_menu/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HealthPawApp extends StatefulWidget {
  HealthPawApp({Key key}) : super(key: key);

  @override
  _HealthPawAppState createState() => _HealthPawAppState();
}

class _HealthPawAppState extends State<HealthPawApp> {
  Widget view = Scaffold();

  static const platform = const MethodChannel('com.example.HealthPaw/mbientlab');

  @override
  void initState() {
    initializeConfig();
    super.initState();
  }

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _connectBoard() async {
    try {
      await platform.invokeMethod('connectBoard', {"boardId": "F0:80:F6:C8:E0:75"});
    } on PlatformException catch (e) {
      print("Fail to connect: $e");
    }
  }

  Future<void> _turnOffLed() async {
    try {
      await platform.invokeMethod('turnOffLed');
    } on PlatformException catch (e) {
      print("Fail to turn off: $e");
    }
  }

  Future<void> _turnOnLed() async {
    try {
      await platform.invokeMethod('turnOnLed', {"colorId": 0});
    } on PlatformException catch (e) {
      print("Fail to turn on: $e");
    }
  }

  void initializeConfig() async {
    await AppConfig.setAppLanguage();
    await Preferences.initPrefs();
    User user = Preferences.getUser;
    if (user != null) {
      await UserService.updateUserLocalData;
      setState(() {
        view = MainMenuView();
      });
    } else {
      setState(() {
        view = LoginView();
      });
    }
    
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
      home: Scaffold(
        body: Material(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text('Connect Board'),
                  onPressed: _connectBoard,
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('Turn On Led'),
                  onPressed: _turnOnLed,
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text('Turn Off Led'),
                  onPressed: _turnOffLed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
