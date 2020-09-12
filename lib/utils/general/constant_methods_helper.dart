import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';

class ConstantMethodHelper {
  static String userTypeValue(int userTypeId) {
    switch (userTypeId) {
      case ConstantHelper.USER_TYPE_ADMIN_ID: return AppStrings.administrator; break;
      case ConstantHelper.USER_TYPE_OWNER_ID: return AppStrings.owner; break;
      case ConstantHelper.USER_TYPE_VET_ID:   return AppStrings.veterinarian; break;
      default:                                return "";
    }
  }
}