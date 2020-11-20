// import 'package:HealthPaw/config/strings/app_strings.dart';
// import 'package:HealthPaw/models/pet/pet.dart';
// import 'package:HealthPaw/utils/widgets/common_app_bar.dart';
// import 'package:HealthPaw/views/report_pet_status/widgets/report_pet_status_content.dart';
// import 'package:flutter/material.dart';

// class ReportPetStatusView extends StatefulWidget {
//   final Pet pet;
//   ReportPetStatusView({Key key, this.pet}) : super(key: key);

//   @override
//   _ReportPetStatusViewState createState() => _ReportPetStatusViewState();
// }

// class _ReportPetStatusViewState extends State<ReportPetStatusView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: <Widget>[
//             CommonAppBar(title: AppStrings.reportStatus, showHeader: true),
//             Expanded(child: ReportPetStatusContent(pet: widget.pet)),
//           ],
//         ),
//       ),
//     );
//   }
// }