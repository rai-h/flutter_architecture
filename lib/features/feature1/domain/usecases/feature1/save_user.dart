import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/core/errors/failure.dart';
import 'package:flutter_architecture/core/usecases/usecase.dart';
import 'package:flutter_architecture/features/feature1/data/models/user.model.dart';
import 'package:flutter_architecture/features/feature1/domain/entities/user.dart';
import 'package:flutter_architecture/features/feature1/domain/repositories/user_repository.dart';

class SaveUser extends UseCase<void, Params> {
  final UserRepository userRepository;

  SaveUser({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await userRepository.saveUserDetails(params.user);
  }
}

class Params extends Equatable {
  User user;

  Params({required this.user});

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
