import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/pet/pet.dart';
import 'package:HealthPaw/navigation/navigation_methods.dart';
import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
import 'package:HealthPaw/views/cardiac_history/widgets/cardiac_history_content.dart';
import 'package:HealthPaw/views/cardiac_today/cardiac_today.dart';
import 'package:flutter/material.dart';

class CardiacHistoryView extends StatefulWidget {
  final bool backToToday;
  final Pet pet;
  CardiacHistoryView({Key key, this.backToToday = false, this.pet}) : super(key: key);

  @override
  _CardiacHistoryViewState createState() => _CardiacHistoryViewState();
}

class _CardiacHistoryViewState extends State<CardiacHistoryView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.backToToday) {
          NavigationMethods.of(context).navigateReplacement(CardiacTodayView(pet: widget.pet));
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              CommonAppBar(
                title: AppStrings.cardiacHistory,
                showHeader: true,
                handleBack: widget.backToToday
                    ? () => NavigationMethods.of(context)
                        .navigateReplacement(CardiacTodayView(pet: widget.pet))
                    : null,
              ),
              Expanded(child: CardiacHistoryContent(pet: widget.pet)),
            ],
          ),
        ),
      ),
    );
  }
}
