import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/owner/widgets/owner_content.dart';
import 'package:HealthPaw/views/owner/widgets/owner_navigation_bar.dart';
import 'package:flutter/material.dart';

class OwnerView extends StatefulWidget {
  OwnerView({Key key}) : super(key: key);

  @override
  _OwnerViewState createState() => _OwnerViewState();
}

class _OwnerViewState extends State<OwnerView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.owner, showLogout: true),
            Expanded(child: OwnerContent()),
          ],
        ),
        bottomNavigationBar: MainNavigationBar(),
      ),
    );
  }
}
