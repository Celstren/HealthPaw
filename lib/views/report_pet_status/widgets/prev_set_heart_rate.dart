import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/report_pet_status/widgets/set_pet_heart_rate.dart';
import 'package:flutter/material.dart';

class PrevSetHeartrate extends StatefulWidget {
  PrevSetHeartrate({Key key}) : super(key: key);

  @override
  _PrevSetHeartrateState createState() => _PrevSetHeartrateState();
}

class _PrevSetHeartrateState extends State<PrevSetHeartrate> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CommonAppBar(title: AppStrings.petStatus, showHeader: true),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Material(
                  child: InkWell(
                    onTap: () => NavigationMethods.of(context)
                        .navigateTo(SetPetHeartRate()),
                    child: Container(
                      child: Image.asset('assets/tutorials/heartrate.jpeg'),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                child: Text('Toque aquí o en la imagen para continuar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.Montserrat_SemiBold,
                      fontSize: 17.0,
                      color: AppColors.PrimaryWhite,
                    )),
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                color: AppColors.PrimaryLightBlue,
                height: 50,
                onPressed: () =>
                    NavigationMethods.of(context).navigateTo(SetPetHeartRate()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
