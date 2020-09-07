import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/main_menu/widgets/main_menu_content.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.menu, showHeader: false, showLogout: true),
            Expanded(child: MainMenuContent()),
          ],
        ),
        bottomNavigationBar: MainNavigationBar(),
      ),
    );
  }
}
