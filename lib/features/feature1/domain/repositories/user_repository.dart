import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/core/errors/failure.dart';
import 'package:flutter_architecture/features/feature1/data/models/user.model.dart';
import 'package:flutter_architecture/features/feature1/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserDetails();
  Future<Either<Failure, void>> saveUserDetails(User user);
}
