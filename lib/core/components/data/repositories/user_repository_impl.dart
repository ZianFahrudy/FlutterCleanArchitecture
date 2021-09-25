import 'package:flutter_clean_architecture/core/components/data/datasources/common/base_datasource_factory.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/common/datasource_factory.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/components/domains/repository/user_repository.dart';
import 'package:flutter_clean_architecture/core/exceptions/failure.dart';

class UserRepositoryImpl implements UserRepository {
  late final BindingDataSourceFactory _bindingDataSource;

  UserRepositoryImpl(this._bindingDataSource);

  @override
  Stream<Either<Failure, LoginModelEntity>> requestLogin(LoginBody body) {
    return _bindingDataSource
        .createData(DataSourceState.network)!
        .requestLogin(body)
        .map((event) => Right(event));
  }
}
