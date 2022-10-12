import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;

  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone})
      : super();
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, email, phone];
}
