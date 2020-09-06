import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:flutter/material.dart';

class OwnerNavigationBar extends StatefulWidget {
  OwnerNavigationBar({Key key}) : super(key: key);

  @override
  _OwnerNavigationBarState createState() => _OwnerNavigationBarState();
}

class _OwnerNavigationBarState extends State<OwnerNavigationBar> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indexSelected,
      onTap: (int index) {
        setState(() {
          indexSelected = index;
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
