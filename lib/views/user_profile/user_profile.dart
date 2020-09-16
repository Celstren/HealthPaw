import 'package:HealthPaw/utils/general/constant_methods_helper.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class UserProfileView extends StatefulWidget {
  UserProfileView({Key key}) : super(key: key);

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: ConstantMethodHelper.profileTitle, showHeader: true),
            Expanded(child: ConstantMethodHelper.profileContent),
          ],
        ),
      ),
    );
  }
}
