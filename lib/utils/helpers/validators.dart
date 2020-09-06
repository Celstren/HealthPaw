class Validators {
  static const Pattern _numberPattern = r"^[0-9]*$";
  static const Pattern _emailPattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  static const Pattern _phonePattern = r"^[+][0-9]{1,}$";
  static const Pattern _passwordPattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";

  static bool validString(String value, {int maxLength = 250})  => value != null && value.trim().isNotEmpty && value.trim().length <= maxLength;

  static bool validNumber(String value)                         => validString(value) && RegExp(_numberPattern).hasMatch(value);

  static bool validEmail(String value)                          => validString(value) && RegExp(_emailPattern).hasMatch(value);

  static bool validMobileNumber(String value)                    => validString(value) && RegExp(_phonePattern).hasMatch(value);

  static bool validPassword(String value)                       => validString(value) && RegExp(_passwordPattern).hasMatch(value);
}