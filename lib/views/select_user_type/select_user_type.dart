import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/general/enums.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/select_user_type/widgets/select_user_type_content.dart';
import 'package:flutter/material.dart';

class SelectUserTypeView extends StatefulWidget {
  final SelectType selectType;
  SelectUserTypeView({Key key, this.selectType = SelectType.Register}) : super(key: key);

  @override
  _SelectUserTypeViewState createState() => _SelectUserTypeViewState();
}

class _SelectUserTypeViewState extends State<SelectUserTypeView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: widget.selectType == SelectType.Register ? AppStrings.register : AppStrings.users, showHeader: true),
            Expanded(child: SelectUserTypeContent(selectType: widget.selectType)),
          ],
        ),
      ),
    );
  }
}
