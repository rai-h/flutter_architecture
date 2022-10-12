import 'dart:io';

import 'package:flutter_architecture/features/feature1/data/models/user.model.dart';
import 'package:flutter_architecture/features/feature1/domain/entities/user.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> getUserDetails();
  @override
  Future<void> saveUserDetails(User user);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUserDetails() {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<void> saveUserDetails(User user) {
    // TODO: implement saveUserDetails
    throw UnimplementedError();
  }
}
