import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/owner_menu/widgets/owner_menu_content.dart';
import 'package:flutter/material.dart';

class OwnerMenuView extends StatefulWidget {
  OwnerMenuView({Key key}) : super(key: key);

  @override
  _OwnerMenuViewState createState() => _OwnerMenuViewState();
}

class _OwnerMenuViewState extends State<OwnerMenuView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petStatus, showHeader: true),
            Expanded(child: OwnerMenuContent()),
          ],
        ),
      ),
    );
  }
}
