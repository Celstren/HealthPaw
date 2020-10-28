import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/models/globalNotification/globalNotification.dart';
import 'package:HealthPaw/services/globalNotification/globalNotificationService.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/custom_dialog.dart';
import 'package:HealthPaw/utils/widgets/ok_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class SendGlobalNotificationContent extends StatefulWidget {
  SendGlobalNotificationContent({Key key}) : super(key: key);

  @override
  _SendGlobalNotificationContentState createState() =>
      _SendGlobalNotificationContentState();
}

class _SendGlobalNotificationContentState
    extends State<SendGlobalNotificationContent> {
  final TextEditingController messageController = TextEditingController();
  DateTime date = DateTime.now();
  bool invalidMessage = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 60),
          Text(
            AppStrings.message,
            style: AppTextStyle.blackStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSizes.subitle16,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.PrimaryBlack, width: 3),
            ),
            child: TextField(
              controller: messageController,
              maxLines: null,
              onChanged: (value) {
                if (invalidMessage) {
                  setState(() {
                    invalidMessage = false;
                  });
                }
              },
              decoration: InputDecoration.collapsed(
                hintText: AppStrings.enterMessage,
                hintStyle: AppTextStyle.darkGreyStyle(
                  fontSize: AppFontSizes.text12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          invalidMessage
              ? Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    AppStrings.invalidMessage,
                    style: AppTextStyle.redStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSizes.text12,
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(height: 30),
          Text(
            AppStrings.date,
            style: AppTextStyle.blackStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSizes.subitle16,
            ),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () async {
              var pick = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: date,
                lastDate: DateTime(2100),
              );
              if (pick != null) {
                setState(() {
                  date = DateTime(
                      pick.year, pick.month, pick.day, date.hour, date.minute);
                });
              }
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.PrimaryBlack, width: 3),
              ),
              child: Center(
                child: Text(
                  DateFormat("yyyy/MM/dd").format(date),
                  textAlign: TextAlign.center,
                  style: AppTextStyle.darkGreyStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: AppFontSizes.subitle16,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            AppStrings.time,
            style: AppTextStyle.blackStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSizes.subitle16,
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new WheelChooser.integer(
                    initValue: 0,
                    minValue: 0,
                    maxValue: 23,
                    listHeight: 100,
                    listWidth: 50,
                    isInfinite: true,
                    onValueChanged: (digit) {
                      setState(() {
                        date = DateTime(date.year, date.month, date.day, digit,
                            date.minute);
                      });
                    }),
                Text(
                  ":",
                  style: AppTextStyle.blackStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSizes.subitle16,
                  ),
                ),
                new WheelChooser.integer(
                    initValue: 0,
                    minValue: 0,
                    maxValue: 45,
                    listHeight: 100,
                    listWidth: 50,
                    isInfinite: true,
                    step: 15,
                    onValueChanged: (digit) {
                      setState(() {
                        date = DateTime(
                            date.year, date.month, date.day, date.hour, digit);
                      });
                    }),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        String message = messageController.value.text.trim();
                        if (message.isNotEmpty && date != null) {
                          GlobalNotification notification = GlobalNotification(
                            title: "HealthPaw",
                            body: message,
                            date: date.toIso8601String(),
                            sent: false,
                          );
                          bool success = await GlobalNotificationService
                              .registerGlobalNotification(notification);
                          if (success) {
                            showCustomDialog(
                                context: context,
                                builder: (context) {
                                  return CustomDialog(
                                    backgroundColor: Colors.transparent,
                                    child: OkDialog(
                                      height: 150,
                                      title: AppStrings.registeredAlert,
                                      okText: AppStrings.close,
                                      onPress: () => Navigator.pop(context),
                                    ),
                                  );
                                });
                          }
                        } else if (message.isEmpty) {
                          setState(() {
                            invalidMessage = true;
                          });
                        }
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.PrimaryLightBlue,
                        ),
                        child: Center(
                          child: Text(
                            AppStrings.register,
                            style: AppTextStyle.whiteStyle(
                              fontSize: AppFontSizes.subitle16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.PrimaryLightBlue,
                        ),
                        child: Center(
                          child: Text(
                            AppStrings.cancel,
                            style: AppTextStyle.whiteStyle(
                              fontSize: AppFontSizes.subitle16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
