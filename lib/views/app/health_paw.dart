import 'package:HealthPaw/config/app_config.dart';
import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/views/sync_wearable/sync_wearable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

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
    await Preferences.initPrefs();
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    if (mounted) {
      setState(() {
        view = SyncWearableView();
      });
      // User user = Preferences.getUser;
      // if (user != null) {
      //     await UserService.updateUserLocalData;
      //     setState(() {
      //       view = MainMenuView();
      //     });
      //   } else {
      //     setState(() {
      //       view = LoginView();
      //     });
      //   }
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
        body: view,
      ),
    );
  }
}
