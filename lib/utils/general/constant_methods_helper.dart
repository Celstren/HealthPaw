import 'dart:io';

import 'package:HealthPaw/config/strings/app_strings.dart';
import 'package:HealthPaw/data/shared_preferences/preferences.dart';
import 'package:HealthPaw/utils/general/constant_helper.dart';
import 'package:HealthPaw/views/main_menu/widgets/admin_main_menu_content.dart';
import 'package:HealthPaw/views/main_menu/widgets/owner_main_menu_content.dart';
import 'package:HealthPaw/views/main_menu/widgets/vet_main_menu_content.dart';
import 'package:HealthPaw/views/select_pet_type/widgets/select_pet_type_content.dart';
import 'package:HealthPaw/views/user_profile/widgets/admin_profile_content.dart';
import 'package:HealthPaw/views/user_profile/widgets/owner_profile_content.dart';
import 'package:HealthPaw/views/user_profile/widgets/vet_profile_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ConstantMethodHelper {
  static String userTypeValue(int userTypeId) {
    switch (userTypeId) {
      case ConstantHelper.USER_TYPE_ADMIN_ID: return AppStrings.administrator; break;
      case ConstantHelper.USER_TYPE_OWNER_ID: return AppStrings.owner; break;
      case ConstantHelper.USER_TYPE_VET_ID:   return AppStrings.veterinarian; break;
      default:                                return "";
    }
  }

  static String petTypeValue(PetType petType) {
    switch (petType) {
      case PetType.Dog: return AppStrings.dog; break;
      case PetType.Cat: return AppStrings.cat; break;
      default:          return "";
    }
  }

  static String get mainTitle {
    int userTypeId = Preferences.getUser.type;
    switch (userTypeId) {
      case ConstantHelper.USER_TYPE_ADMIN_ID: return AppStrings.administrator; break;
      case ConstantHelper.USER_TYPE_OWNER_ID: return AppStrings.menu; break;
      case ConstantHelper.USER_TYPE_VET_ID:   return AppStrings.veterinarian; break;
      default:                                return "";
    }
  }

  static Widget get mainContent {
    int userTypeId = Preferences.getUser.type;
    switch (userTypeId) {
      case ConstantHelper.USER_TYPE_ADMIN_ID: return AdminMainMenuContent(); break;
      case ConstantHelper.USER_TYPE_OWNER_ID: return OwnerMainMenuContent(); break;
      case ConstantHelper.USER_TYPE_VET_ID:   return VetMainMenuContent(); break;
      default:                                return Container();
    }
  }

  static String get profileTitle {
    int userTypeId = Preferences.getUser.type;
    switch (userTypeId) {
      case ConstantHelper.USER_TYPE_ADMIN_ID: return AppStrings.administratorProfile; break;
      case ConstantHelper.USER_TYPE_OWNER_ID: return AppStrings.ownerProfile; break;
      case ConstantHelper.USER_TYPE_VET_ID:   return AppStrings.veterinarianProfile; break;
      default:                                return "";
    }
  }

  static Widget get profileContent {
    int userTypeId = Preferences.getUser.type;
    switch (userTypeId) {
      case ConstantHelper.USER_TYPE_ADMIN_ID: return AdminProfileContent(); break;
      case ConstantHelper.USER_TYPE_OWNER_ID: return OwnerProfileContent(); break;
      case ConstantHelper.USER_TYPE_VET_ID:   return VetProfileContent(); break;
      default:                                return Container();
    }
  }
}