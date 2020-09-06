import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/owner_profile/widgets/owner_profile_content.dart';
import 'package:flutter/material.dart';

class OwnerProfileView extends StatefulWidget {
  OwnerProfileView({Key key}) : super(key: key);

  @override
  _OwnerProfileViewState createState() => _OwnerProfileViewState();
}

class _OwnerProfileViewState extends State<OwnerProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.ownerProfile, showHeader: true),
            Expanded(child: OwnerProfileContent()),
          ],
        ),
      ),
    );
  }
}
