import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/utils/widgets/overview_field.dart';
import 'package:flutter/material.dart';

class AdminProfileContent extends StatefulWidget {
  AdminProfileContent({Key key}) : super(key: key);

  @override
  _AdminProfileContentState createState() => _AdminProfileContentState();
}

class _AdminProfileContentState extends State<AdminProfileContent> {
  String name = Preferences.getUser.name;
  String lastName = Preferences.getUser.name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20),
                      OverviewField(label: AppStrings.names, text: name),
                      SizedBox(height: 10),
                      OverviewField(label: AppStrings.lastnames, text: lastName),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: 110,
                          width: 110,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/admin.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
