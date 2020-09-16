import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/views/main_menu/main_menu.dart';
import 'package:HealthPaw/views/user_profile/user_profile.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatefulWidget {
  MainNavigationBar({Key key}) : super(key: key);

  @override
  _MainNavigationBarState createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indexSelected,
      onTap: (int index) {
        setState(() {
          indexSelected = index;
          if (index == 1) {
            NavigationMethods.of(context).navigateTo(UserProfileView());
          } else {
            NavigationMethods.of(context).navigateAndRemoveUntil(MainMenuView());
          }
        });
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          title: Text(AppStrings.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text(AppStrings.profile),
        ),
      ],
    );
  }
}
