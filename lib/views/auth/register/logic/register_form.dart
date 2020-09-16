import 'package:HealthPaw/models/user/user.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';
import 'package:HealthPaw/utils/helpers/validators.dart';
import 'package:flutter/material.dart';

class RegisterForm {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController documentNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  DateTime dateController;
  TextEditingController emailController = TextEditingController();
  int userTypeController = ConstantHelper.USER_TYPE_ADMIN_ID;

  DateTime minDate = DateTime(DateTime.now().year - 100),
      maxDate = DateTime.now();

  String get name => this.nameController.value.text;
  String get lastname => this.lastnameController.value.text;
  String get username => this.usernameController.value.text;
  String get documentNumber => this.documentNumberController.value.text;
  String get password => this.passwordController.value.text;
  String get password2 => this.password2Controller.value.text;
  String get mobile => this.mobileController.value.text;
  DateTime get date => this.dateController;
  String get email => this.emailController.value.text;
  int get userType => this.userTypeController;

  bool validNameValue = true;
  bool validLastnameValue = true;
  bool validUsernameValue = true;
  bool validDocumentNumberValue = true;
  bool validPasswordValue = true;
  bool validPassword2Value = true;
  bool validMobileValue = true;
  bool validDateValue = true;
  bool validEmailValue = true;

  bool get validName => Validators.validString(name, maxLength: 50);
  bool get validLastname => Validators.validString(lastname, maxLength: 50);
  bool get validUsername => Validators.validString(username, maxLength: 20);
  bool get validDocumentNumber =>
      Validators.validString(username, maxLength: 20);
  bool get validPassword => Validators.validPassword(password);
  bool get validPassword2 =>
      Validators.validPassword(password2) && password2 == password;
  bool get validMobile => Validators.validNumber(mobile);
  bool get validDate =>
      date != null && minDate.isBefore(date) && maxDate.isAfter(date);
  bool get validEmail => Validators.validEmail(email);

  bool get validForm =>
      this.validName &&
      this.validLastname &&
      this.validUsername &&
      this.validDocumentNumber &&
      this.validPassword &&
      this.validPassword2 &&
      this.validMobile &&
      this.validDate &&
      this.validEmail;

  void setValidatorsValue() {
    this.validNameValue = true;
    this.validLastnameValue = true;
    this.validUsernameValue = true;
    this.validDocumentNumberValue = true;
    this.validPasswordValue = true;
    this.validPassword2Value = true;
    this.validMobileValue = true;
    this.validDateValue = true;
    this.validEmailValue = true;
    userTypeController = 1;
  }

  void validateValues() {
    this.validNameValue = validName;
    this.validLastnameValue = validLastname;
    this.validUsernameValue = validUsername;
    this.validDocumentNumberValue = validUsername;
    this.validPasswordValue = validPassword;
    this.validPassword2Value = validPassword2;
    this.validMobileValue = validMobile;
    this.validDateValue = validDate;
    this.validEmailValue = validEmail;
  }

  User get result => User(
        name: name,
        lastName: lastname,
        pets: [],
        secondLastName: "",
        image: "",
        username: username,
        password: password,
        email: email,
        phone: int.tryParse(mobile),
        documentNumber: documentNumber,
        birthDay: dateController,
        type: userType,
      );
}
