import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/utils/widgets/text_field_container.dart';
import 'package:HealthPaw/views/auth/login/widgets/login_logo.dart';
import 'package:HealthPaw/views/auth/login_web/widgets/input_field.dart';
import 'package:HealthPaw/views/auth/login_web/widgets/login_home.dart';
import 'package:HealthPaw/views/environment_temperature/environment_temperature.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  LoginContent({Key key}) : super(key: key);

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.lightBlue[600],
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 85.0, right: 50.0, left: 50.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 60.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "HealthPaw Logo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Text(
                              "HealthPaw Logo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 140.0, right: 70.0, left: 70.0, bottom: 5.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: FlatButton(
                              color: AppColors.PrimaryBlack,
                              onPressed: () {},
                              child: Text(
                                AppStrings.login,
                                style: AppTextStyle.whiteStyle(),
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          Align(
                            alignment: Alignment.center,
                            child: FlatButton(
                              color: AppColors.PrimaryBlack,
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return new Home();
                                }));
                              },
                              child: Text(
                                AppStrings.register,
                                style: AppTextStyle.whiteStyle(),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.w600,
                            fontSize: 35.0,
                            fontFamily: 'Merriweather'),
                      ),
                      const SizedBox(height: 21.0),

                      //InputField Widget from the widgets folder
                      InputField(content: "Username"),

                      SizedBox(height: 20.0),

                      InputField(content: "Password"),

                      SizedBox(height: 20.0),

                      Row(
                        // Aca poner el Round Button
                        children: <Widget>[
                          RoundedButton(
                              style: AppTextStyle.whiteStyle(),
                              text: AppStrings.login,
                              press: () => {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
