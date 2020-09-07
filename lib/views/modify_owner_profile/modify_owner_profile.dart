import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/modify_owner_profile/widgets/modify_owner_profile_content.dart';
import 'package:flutter/material.dart';

class ModifyOwnerProfileView extends StatefulWidget {
  ModifyOwnerProfileView({Key key}) : super(key: key);

  @override
  _ModifyOwnerProfileViewState createState() => _ModifyOwnerProfileViewState();
}

class _ModifyOwnerProfileViewState extends State<ModifyOwnerProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.modifyOwnerProfile, showHeader: true),
            Expanded(child: ModifyOwnerProfileContent()),
          ],
        ),
      ),
    );
  }
}
