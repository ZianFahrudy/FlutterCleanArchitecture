import 'package:flutter_clean_architecture/core/components/domains/entities/request/login_body_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable(
  createFactory: false,
)
class LoginBody extends LoginBodyEntity {
  final String? email;
  final String? password;

  LoginBody({this.email, this.password})
      : super(email: email, password: password);

  Map<String, dynamic> toJson() => _$LoginBodyToJson(this);
}
