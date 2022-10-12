import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/features/feature1/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required id, required name, required email, required phone})
      : super(email: email, id: id, phone: phone, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
