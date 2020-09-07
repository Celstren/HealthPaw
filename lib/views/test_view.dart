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
        onPress: () => Navigator.of(context)
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
                widgetOption(text: "Pet Status", view: PetStatusView()),
                //widgetOption(text: "Login View", view: LoginView()),
                //widgetOption(text: "Register View", view: RegisterView()),
                //widgetOption(text: "Owner Profile", view: OwnerProfileView()),
                //widgetOption(text: "Modify Owner Profile", view: ModifyOwnerProfileView()),
                //widgetOption(text: "Owner Menu", view: OwnerMenuView()),
                //widgetOption(text: "Select Pet Type", view: SelectPetTypeView()),
                //widgetOption(text: "Register Pet", view: PetInfoView()),
                //widgetOption(text: "Modify Pet", view: PetInfoView(pet: Pet(name: "Firulais", birthDay: DateTime.now()))),
                //widgetOption(text: "Breath History", view: BreathHistoryView()),
                //widgetOption(
                //    text: "Calibrate Wearable", view: CalibrateWearableView()),
                //widgetOption(text: "Collar", view: CollarView()),
                //widgetOption(
                //    text: "Environment Temperature",
                //    view: EnvironmentTemperatureView()),
                //widgetOption(text: "Locate Pet", view: LocatePetView()),
                //widgetOption(text: "Owner", view: OwnerView()),
                //widgetOption(text: "Pet Overview", view: PetOverviewView()),
                //widgetOption(text: "Pet Status", view: PetStatusView()),
                //widgetOption(text: "Sounds", view: SoundsView()),
                //widgetOption(text: "Sync Wearable", view: SyncWearableView()),
                //widgetOption(text: "Default Sounds", view: DefaultSoundsView()),
              ],
            ),
          ),
        ),
      ),);
  }
}