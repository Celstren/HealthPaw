import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/user_info/widgets/user_info_content.dart';
import 'package:flutter/material.dart';

class UserInfoView extends StatefulWidget {
  final UserType userType;
  final User user;
  UserInfoView({Key key, this.userType = UserType.Owner, this.user}) : super(key: key);

  @override
  _UserInfoViewState createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: widget.userType == UserType.Owner ? AppStrings.ownerProfile : AppStrings.veterinarianProfile, showHeader: true),
            Expanded(child: UserInfoContent(user: widget.user, userType: widget.userType)),
          ],
        ),
      ),
    );
  }
}