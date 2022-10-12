import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/core/errors/failure.dart';
import 'package:flutter_architecture/core/usecases/usecase.dart';
import 'package:flutter_architecture/features/feature1/domain/entities/user.dart';
import 'package:flutter_architecture/features/feature1/domain/repositories/user_repository.dart';

class GetUser implements UseCase<User, NoParams> {
  final UserRepository userRepository;

  GetUser({required this.userRepository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await userRepository.getUserDetails();
  }
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
