import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/sync_wearable/widgets/sync_wearable_item.dart';
import 'package:flutter/material.dart';

class SyncWearableContent extends StatefulWidget {
  SyncWearableContent({Key key}) : super(key: key);

  @override
  _SyncWearableContentState createState() => _SyncWearableContentState();
}

class _SyncWearableContentState extends State<SyncWearableContent> {
  List<String> _devices = ["1", "2"];
  String connectionStatus = AppStrings.search;

  List<Widget> _buildItemList() {
    List<Widget> _children = [];
    _children = _devices.map<Widget>((e) => SyncWearableItem(deviceName: "Dispositivo 1")).toList();
    _children.add(_buildConnectionStatus());
    _children.add(_buildConnectionButton());
    _children.add(SizedBox(height: 40));
    return _children;
  }

  Widget _buildConnectionStatus() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        connectionStatus,
        style:
            AppTextStyle.blackStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildConnectionButton() {
    return RoundedButton(
      text: AppStrings.connect,
      size: Size(200, 50),
      style: AppTextStyle.whiteStyle(fontSize: AppFontSizes.title18, fontFamily: AppFonts.Montserrat_Bold),
      onPress: () {},
    );
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
}
