import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/collar/widgets/collar_content.dart';
import 'package:flutter/material.dart';

class CollarView extends StatefulWidget {
  CollarView({Key key}) : super(key: key);

  @override
  _CollarViewState createState() => _CollarViewState();
}

class _CollarViewState extends State<CollarView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petStatus, showHeader: true),
            Expanded(child: CollarContent()),
          ],
        ),
      ),
    );
  }
}
