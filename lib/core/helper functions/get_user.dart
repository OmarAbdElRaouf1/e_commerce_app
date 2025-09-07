import 'dart:convert';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';

import '../services/shared_preferences_singleton.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUser);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
