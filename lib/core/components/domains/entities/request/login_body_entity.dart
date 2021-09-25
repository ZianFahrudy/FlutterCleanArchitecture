import 'package:equatable/equatable.dart';

class LoginBodyEntity extends Equatable {
  final String? email;
  final String? password;

  LoginBodyEntity({this.email, this.password});

  @override
  List<Object?> get props => [email, password];
}
