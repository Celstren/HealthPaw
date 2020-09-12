import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/circular_button.dart';
import 'package:HealthPaw/views/breath_history/breath_history.dart';
import 'package:HealthPaw/views/breath_today/breath_today.dart';
import 'package:HealthPaw/views/cardiac_history/cardiac_history.dart';
import 'package:HealthPaw/views/cardiac_today/cardiac_today.dart';
import 'package:HealthPaw/views/environment_temperature_history/environment_temperature_history.dart';
import 'package:HealthPaw/views/environment_temperature_today/environment_temperature_today.dart';
import 'package:HealthPaw/views/pet_overview/pet_overview.dart';
import 'package:HealthPaw/views/physical_activity_history/physical_activity_history.dart';
import 'package:HealthPaw/views/physical_activity_today/physical_activity_today.dart';
import 'package:HealthPaw/views/sound_history/sound_history.dart';
import 'package:HealthPaw/views/sound_today/sound_today.dart';
import 'package:flutter/material.dart';

class PetStatusContent extends StatefulWidget {
  PetStatusContent({Key key}) : super(key: key);

  @override
  _PetStatusContentState createState() => _PetStatusContentState();
}

class _PetStatusContentState extends State<PetStatusContent> {
  double divisionSize = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: divisionSize),
            CircularButton(
              size: 80,
              onPress: () => NavigationMethods.of(context).navigateTo(PetOverviewView()),
              label: AppStrings.viewOverview,
              icon: Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
            ),
            SizedBox(height: divisionSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(CardiacTodayView()),
                  label: AppStrings.viewHearthRate,
                  icon: Icon(Icons.favorite,
                      size: 30, color: AppColors.PrimaryBlack),
                ),
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(CardiacHistoryView()),
                  label: AppStrings.historyHearthRate,
                  icon: Icon(Icons.favorite,
                      size: 30, color: AppColors.PrimaryBlack),
                ),
              ],
            ),
            SizedBox(height: divisionSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(BreathTodayView()),
                  label: AppStrings.viewBreathRate,
                  icon: Icon(Icons.timer,
                      size: 30, color: AppColors.PrimaryBlack),
                ),
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(BreathHistoryView()),
                  label: AppStrings.historyBreathRate,
                  icon: Icon(Icons.timer,
                      size: 30, color: AppColors.PrimaryBlack),
                ),
              ],
            ),
            SizedBox(height: divisionSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(PhysicalActivityTodayView()),
                  label: AppStrings.viewPhysicalActivity,
                  icon:
                      Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
                ),
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(PhysicalActivityHistoryView()),
                  label: AppStrings.historyPhysicalActivity,
                  icon:
                      Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
                ),
              ],
            ),
            SizedBox(height: divisionSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(SoundTodayView()),
                  label: AppStrings.viewSound,
                  icon:
                      Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
                ),
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(SoundHistoryView()),
                  label: AppStrings.historySound,
                  icon:
                      Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
                ),
              ],
            ),
            SizedBox(height: divisionSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(EnvironmentTemperatureTodayView()),
                  label: AppStrings.viewTemperature,
                  icon:
                      Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
                ),
                CircularButton(
                  size: 80,
                  onPress: () => NavigationMethods.of(context).navigateTo(EnvironmentTemperatureHistoryView()),
                  label: AppStrings.historyTemperature,
                  icon:
                      Icon(Icons.pets, size: 30, color: AppColors.PrimaryBlack),
                ),
              ],
            ),
            SizedBox(height: divisionSize),
          ],
        ),
      ),
    );
  }
}
