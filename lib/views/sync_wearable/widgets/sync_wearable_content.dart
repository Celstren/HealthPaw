import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/sync_wearable/widgets/sync_wearable_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SyncWearableContent extends StatefulWidget {
  SyncWearableContent({Key key}) : super(key: key);

  @override
  _SyncWearableContentState createState() => _SyncWearableContentState();
}

class _SyncWearableContentState extends State<SyncWearableContent> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  static const platform = const MethodChannel('com.example.HealthPaw/mbientlab');

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.PrimaryBlack, width: 2.0),
        ),
        child: Column(children: _buildItemList()),
      ),
    );
  }

    List<Widget> _buildItemList() {
    List<Widget> _children = [];
    _children.add(_buildScanResultList());
    _children.add(_buildConnectionStatus());
    _children.add(_buildConnectionButton());
    _children.add(SizedBox(height: 40));
    return _children;
  }

  Widget _buildScanResultList() {
    return StreamBuilder<List<ScanResult>>(
      initialData: [],
      stream: flutterBlue.scanResults,
      builder: (BuildContext context, AsyncSnapshot<List<ScanResult>> snapshot){
        return snapshot.hasData? Column(children: snapshot.data.map<Widget>((e) => SyncWearableItem(scanResult: e)).toList()) : SizedBox();
    });
  }

  Widget _buildConnectionStatus() {
    return StreamBuilder<bool>(
        initialData: false,
        stream: flutterBlue.isScanning,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              snapshot?.data == true ? AppStrings.searching : AppStrings.search,
              style: AppTextStyle.blackStyle(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
          );
        });
  }

  Widget _buildConnectionButton() {
    return StreamBuilder<bool>(
        initialData: false,
        stream: flutterBlue.isScanning,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return RoundedButton(
            text: snapshot?.data == true ? "${AppStrings.searching}..." : AppStrings.search,
            size: Size(200, 50),
            style: AppTextStyle.whiteStyle(
                fontSize: AppFontSizes.title18,
                fontFamily: AppFonts.Montserrat_Bold),
            onPress: snapshot?.data == true ? () => flutterBlue.scan(timeout: Duration(seconds: 5)) : null,
          );
        });
  }

}
