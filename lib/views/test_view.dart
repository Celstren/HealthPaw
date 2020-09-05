import 'package:HealthPaw/utils/general/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:HealthPaw/views/breath_history/breath_history.dart';
import 'package:HealthPaw/views/calibrate_wearable/calibrate_wearable_view.dart';
import 'package:HealthPaw/views/collar/collar.dart';
import 'package:HealthPaw/views/environment_temperature/environment_temperature.dart';
import 'package:HealthPaw/views/locate_pet/locate_pet.dart';
import 'package:HealthPaw/views/owner/owner.dart';
import 'package:HealthPaw/views/pet_overview/pet_overview.dart';
import 'package:HealthPaw/views/pet_status/pet_status.dart';
import 'package:HealthPaw/views/sounds/sounds.dart';
import 'package:HealthPaw/views/sync_wearable/sync_wearable.dart';
import 'package:HealthPaw/utils/widgets/rounded_button.dart';
import 'package:HealthPaw/views/auth/login/login.dart';

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
        press: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => view)),
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
                widgetOption(text: "Login View", view: LoginView()),
                widgetOption(text: "Breath History", view: BreathHistoryView()),
                widgetOption(
                    text: "Calibrate Wearable", view: CalibrateWearableView()),
                widgetOption(text: "Collar", view: CollarView()),
                widgetOption(
                    text: "Environment Temperature",
                    view: EnvironmentTemperatureView()),
                widgetOption(text: "Locate Pet", view: LocatePetView()),
                widgetOption(text: "Owner", view: OwnerView()),
                widgetOption(text: "Pet Overview", view: PetOverviewView()),
                widgetOption(text: "Pet Status", view: PetStatusView()),
                widgetOption(text: "Sounds", view: SoundsView()),
                widgetOption(text: "Sync Wearable", view: SyncWearableView()),
              ],
            ),
          ),
        ),
      ),);
  }
}