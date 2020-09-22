import 'package:HealthPaw/utils/general/constant_methods_helper.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/utils/widgets/global_dialogs.dart';
import 'package:HealthPaw/views/owner/widgets/owner_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainMenuView extends StatefulWidget {
  MainMenuView({Key key}) : super(key: key);

  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  @override
  Widget build(BuildContext context) {
    GlobalDialogs.initContext(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: ConstantMethodHelper.mainTitle, showHeader: false, showLogout: true),
            Expanded(child: ConstantMethodHelper.mainContent),
          ],
        ),
        bottomNavigationBar: MainNavigationBar(),
      ),
    );
  }
}
