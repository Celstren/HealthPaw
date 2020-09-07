import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/views/owner_profile/owner_profile.dart';
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
            Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OwnerProfileView()));
          } 
        });
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: AppStrings.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppStrings.profile,
        ),
      ],
    );
  }
}
