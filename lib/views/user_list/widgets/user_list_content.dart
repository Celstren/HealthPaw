import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/services/user/user.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/views/user_list/widgets/user_item.dart';
import 'package:flutter/material.dart';

class UserListContent extends StatefulWidget {
  final UserType userType;
  UserListContent({Key key, this.userType = UserType.Owner}) : super(key: key);

  @override
  _UserListContentState createState() => _UserListContentState();
}

class _UserListContentState extends State<UserListContent> {
  List<User> _users = [];
  bool isLoading = true;

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    List<User> users = await UserService.getUsers;
    if (users != null) {
      setState(() {
        isLoading = false;

        switch (widget.userType) {
          case UserType.Owner:
            {
              _users = users
                  .where((element) =>
                      element.type == ConstantHelper.USER_TYPE_OWNER_ID)
                  .toList();
            }
            break;
          case UserType.Vet:
            {
              _users = users
                  .where((element) =>
                      element.type == ConstantHelper.USER_TYPE_VET_ID)
                  .toList();
            }
            break;
          case UserType.Admin:
            {
              _users = users
                  .where((element) =>
                      element.type == ConstantHelper.USER_TYPE_ADMIN_ID)
                  .toList();
            }
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? ListView.builder(
            padding: EdgeInsets.only(top: 20, left: 30, right: 10),
            itemCount: _users.length,
            itemBuilder: (context, index) =>
                UserItem(user: _users[index], userType: widget.userType))
        : Center(child: CircularProgressIndicator());
  }
}
