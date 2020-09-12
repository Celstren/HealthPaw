import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/general/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/views/pet_status/pet_status.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';

class TestView extends StatefulWidget {
  TestView({Key key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {

  Widget widgetOption({String text, Widget view}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: RoundedButton(
        style: AppTextStyle.whiteStyle(),
        text: text,
        onPress: () => NavigationMethods.of(context).navigateTo(view),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widgetOption(text: "Pet Status", view: PetStatusView()),
              ],
            ),
          ),
        ),
      ),);
  }
}