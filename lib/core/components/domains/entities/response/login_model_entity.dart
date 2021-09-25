import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/meta_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/user_model_entity.dart';

class LoginModelEntity extends Equatable {
  final MetaModelEntity? meta;
  final DataLoginModelEntity? data;

  LoginModelEntity({this.meta, this.data});
  @override
  List<Object?> get props => [meta, data];
}

class DataLoginModelEntity extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final UserModelEntity? user;

  DataLoginModelEntity({this.accessToken, this.tokenType, this.user});

  @override
  List<Object?> get props => [accessToken, tokenType, user];
}
