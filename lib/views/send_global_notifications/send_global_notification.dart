import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/send_global_notifications/widgets/send_global_notification_content.dart';
import 'package:flutter/material.dart';

class SendGlobalNotificationView extends StatefulWidget {
  SendGlobalNotificationView({Key key}) : super(key: key);

  @override
  _SendGlobalNotificationViewState createState() => _SendGlobalNotificationViewState();
}

class _SendGlobalNotificationViewState extends State<SendGlobalNotificationView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.register, showHeader: true),
            Expanded(child: SendGlobalNotificationContent()),
          ],
        ),
      ),
    );
  }
}
