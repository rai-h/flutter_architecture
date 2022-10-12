import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture/core/errors/exceptions.dart';
import 'package:flutter_architecture/core/errors/failure.dart';
import 'package:flutter_architecture/features/feature1/data/models/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDatasource {
  Future<UserModel> getUser();
  Future<void> cacheUser(UserModel userToCache);
}

class UserLocalDatasourceImpl extends UserLocalDatasource {
  final SharedPreferences sharedPreferences;

  UserLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel userToCache) async {
    sharedPreferences.setString(
        'Cached_User_key', userToCache.toJson().toString());
  }

  @override
  Future<UserModel> getUser() async {
    final String? userJsonString =
        sharedPreferences.getString('Cached_User_key');
    if (userJsonString != null) {
      return (json.decode(userJsonString));
    } else {
      throw CacheException();
    }
  }
}
