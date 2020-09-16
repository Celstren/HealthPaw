import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/utils/helpers/validators.dart';
import 'package:flutter/material.dart';

class LoginForm {
  TextEditingController documentNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  DateTime minDate = DateTime(DateTime.now().year - 100),
      maxDate = DateTime.now();

  String get documentNumber => this.documentNumberController.value.text;
  String get password => this.passwordController.value.text;

  bool validDocumentNumberValue = true;
  bool validPasswordValue = true;

  bool get validPassword => Validators.validString(password);
  bool get validDocumentNumber => Validators.validString(documentNumber);
  bool get validForm => this.validPassword && this.validDocumentNumberValue;

  void setValidatorsValue() {
    this.validDocumentNumberValue = true;
    this.validPasswordValue = true;
  }

  void validateValues() {
    this.validDocumentNumberValue = validDocumentNumber;
    this.validPasswordValue = validPassword;
  }

  User get result => User(password: password, documentNumber: documentNumber);
}
