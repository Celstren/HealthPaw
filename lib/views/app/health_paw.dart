import 'package:HealthPaw/config/app_config.dart';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/views/home/home_view.dart';
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

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  void initializeConfig() async {
    await AppConfig.setAppLanguage();
    setState(() {
      view = HomeView();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Text('Get Battery Level'),
                  onPressed: _getBatteryLevel,
                ),
                Text(_batteryLevel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
