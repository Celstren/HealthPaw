import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/manual_register/widgets/manual_register_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManualRegisterView extends StatefulWidget {
  final UserType userType;
  ManualRegisterView({Key key, this.userType = UserType.Owner}) : super(key: key);

  @override
  _ManualRegisterViewState createState() => _ManualRegisterViewState();
}

class _ManualRegisterViewState extends State<ManualRegisterView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.PrimaryLightBlue));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          ManualRegisterContent(userType: widget.userType),
          CommonAppBar(title: widget.userType == UserType.Owner ? AppStrings.registerOwner : AppStrings.registerVet),
        ],
      ),
      backgroundColor: AppColors.PrimaryWhite,
    ));
  }
}
