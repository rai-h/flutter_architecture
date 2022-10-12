import 'package:flutter_architecture/core/platform/network_info.dart';
import 'package:flutter_architecture/features/feature1/data/datasource/user_local_datasource.dart';
import 'package:flutter_architecture/features/feature1/data/datasource/user_remote_datasource.dart';
import 'package:flutter_architecture/features/feature1/data/models/user.model.dart';
import 'package:flutter_architecture/features/feature1/domain/entities/user.dart';
import 'package:flutter_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/features/feature1/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDatasource localDatasource;
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl(
      {required this.localDatasource,
      required this.remoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, User>> getUserDetails() async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel user = await remoteDataSource.getUserDetails();
        localDatasource.cacheUser(user);
        return right(user);
      } catch (e) {
        return left(ServerFailure());
      }
    } else {
      try {
        final UserModel user = await localDatasource.getUser();
        return right(user);
      } catch (e) {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> saveUserDetails(User user) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.saveUserDetails(user);
        return right(null);
      } catch (e) {
        return left(ServerFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }
}
