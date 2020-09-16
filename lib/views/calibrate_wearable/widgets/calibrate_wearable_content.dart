import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/views/calibrate_wearable/widgets/calibrate_wearable_item.dart';
import 'package:flutter/material.dart';

class CalibrateWearableContent extends StatefulWidget {
  CalibrateWearableContent({Key key}) : super(key: key);

  @override
  _CalibrateWearableContentState createState() => _CalibrateWearableContentState();
}

class _CalibrateWearableContentState extends State<CalibrateWearableContent> {
  List<String> _devices = ["1", "2"];

  List<Widget> _buildItemList() {
    List<Widget> _children = [];
    _children = _devices.map<Widget>((e) => CalibrateWearableItem(deviceName: "Dispositivo 1")).toList();
    _children.add(SizedBox(height: 40));
    return _children;
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
