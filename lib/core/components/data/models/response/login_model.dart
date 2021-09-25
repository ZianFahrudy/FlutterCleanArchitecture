import 'package:flutter_clean_architecture/core/components/data/models/response/user_model.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'meta_model.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false, explicitToJson: false)
class LoginModel extends LoginModelEntity {
  final MetaModel? meta;
  final DataLoginModel? data;

  LoginModel({this.meta, this.data}) : super(data: data, meta: meta);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@JsonSerializable(
    createToJson: false, explicitToJson: false, fieldRename: FieldRename.snake)
class DataLoginModel extends DataLoginModelEntity {
  final String? accessToken;
  final String? tokenType;
  final UserModel? user;

  DataLoginModel({this.accessToken, this.tokenType, this.user})
      : super(accessToken: accessToken, tokenType: tokenType, user: user);

  factory DataLoginModel.fromJson(Map<String, dynamic> json) =>
      _$DataLoginModelFromJson(json);
}
