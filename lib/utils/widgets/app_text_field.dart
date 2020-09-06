import 'package:flutter/material.dart';
import 'package:HealthPaw/utils/exports/app_design.dart';
import 'package:HealthPaw/utils/widgets/text_field_container.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppSimpleTextField extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final Size size;
  final List<TextInputFormatter> inputFormatters;
  final Function(String) onChanged;
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final String hint;
  final bool isValid;
  final String errorMsg;

  const AppSimpleTextField(
      {Key key,
      this.title = "",
      this.size,
      this.inputFormatters,
      this.onChanged,
      this.controller,
      this.onSubmitted,
      this.hint = "",
      this.isValid = true,
      this.errorMsg = "",
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _validationSection = SizedBox();

    if (!isValid) {
      _validationSection = Text(errorMsg,
          style: AppTextStyle.redStyle(fontSize: AppFontSizes.text12));
    }

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              maxLines: null,
              style: titleStyle ??
                  AppTextStyle.blackStyle(fontWeight: FontWeight.bold)),
          TextFieldContainer(
            size: size ?? Size(375, 40),
            controller: controller,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onSubmitted: onSubmitted,
            backgroundColor: AppColors.PrimaryWhite,
            hint: hint,
            hintStyle:
                AppTextStyle.blackStyle(fontSize: AppFontSizes.subitle16),
            style: AppTextStyle.blackStyle(fontSize: AppFontSizes.subitle16),
            borderRadius: AppBorderRadius.all(radius: AppRadius.radius5),
            border: AppBorder.blackBorder,
            collapsed: true,
          ),
          _validationSection,
        ],
      ),
    );
  }
}

class AppDateTextField extends StatefulWidget {
  final String title;
  final TextStyle titleStyle;
  final DateTime controller;
  final Function(DateTime) onSelected;
  final String hint;
  final bool isValid;
  final String errorMsg;
  AppDateTextField(
      {Key key,
      this.title = "",
      this.controller,
      this.onSelected,
      this.hint = "",
      this.isValid = true,
      this.errorMsg = "",
      this.titleStyle})
      : super(key: key);

  @override
  _AppDateTextFieldState createState() => _AppDateTextFieldState();
}

class _AppDateTextFieldState extends State<AppDateTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title,
              style: widget.titleStyle ??
                  AppTextStyle.blackStyle(fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () async {
              DateTime dateSelected = await showDatePicker(
                  context: context,
                  initialDate: widget.controller ?? DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 100),
                  lastDate: DateTime.now());
              if (dateSelected != null && widget.onSelected != null) {
                widget.onSelected(dateSelected);
              }
            },
            child: Container(
              width: 375,
              height: 40,
              decoration: BoxDecoration(
                border: AppBorder.blackBorder,
                borderRadius: AppBorderRadius.all(radius: AppRadius.radius5),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.controller != null
                        ? DateFormat("dd/MM/yyyy").format(widget.controller)
                        : widget.hint,
                    style: AppTextStyle.blackStyle(
                        fontSize: AppFontSizes.subitle16),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ),
          widget.isValid
              ? SizedBox()
              : Text(widget.errorMsg,
                  style: AppTextStyle.redStyle(fontSize: AppFontSizes.text12)),
        ],
      ),
    );
  }
}