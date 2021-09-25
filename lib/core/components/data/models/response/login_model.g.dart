// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return LoginModel(
    meta: json['meta'] == null
        ? null
        : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    data: json['data'] == null
        ? null
        : DataLoginModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

DataLoginModel _$DataLoginModelFromJson(Map<String, dynamic> json) {
  return DataLoginModel(
    accessToken: json['access_token'] as String?,
    tokenType: json['token_type'] as String?,
    user: json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  );
}
