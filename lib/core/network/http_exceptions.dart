import 'package:flutter_architecture/core/errors/exceptions.dart';

class FetchDataException extends ServerException {
  final String message;
  final int statusCode;
  FetchDataException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Fetch Exception occured with status code $statusCode : $message";
  }
}

class BadRequestException extends ServerException {
  final String message;
  final int statusCode;
  BadRequestException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Bad Request Exception occured with status code $statusCode : $message";
  }
}

class UnauthorisedException extends ServerException {
  final String message;
  final int statusCode;
  UnauthorisedException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Unauthorised Exception occured with status code $statusCode : $message";
  }
}

class InvalidInputException extends ServerException {
  final String message;
  final int statusCode;
  InvalidInputException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Invalid Input Exception occured with status code $statusCode : $message";
  }
}

class AuthenticationException extends ServerException {
  final String message;
  final int statusCode;
  AuthenticationException({required this.statusCode, required this.message})
      : super();

  @override
  String toString() {
    return "Auth Exception occured with status code $statusCode : $message";
  }
}
