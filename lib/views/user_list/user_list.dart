import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/user_list/widgets/user_list_content.dart';
import 'package:flutter/material.dart';

class UserListView extends StatefulWidget {
  final UserType userType;
  UserListView({Key key, this.userType = UserType.Owner}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: widget.userType == UserType.Owner?  AppStrings.owners : AppStrings.vets),
            Expanded(child: UserListContent(userType: widget.userType)),
          ],
        ),
      ),
    );
  }
}