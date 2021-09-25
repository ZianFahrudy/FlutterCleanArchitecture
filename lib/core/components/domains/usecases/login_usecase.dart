import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/domains/repository/user_repository.dart';
import 'package:flutter_clean_architecture/core/exceptions/failure.dart';
import 'package:flutter_clean_architecture/core/interactor/usecase.dart';

class LoginUseCase extends UseCase<LoginModelEntity, LoginBody> {
  final UserRepository repository;

  LoginUseCase(this.repository);

  @override
  Stream<Either<Failure, LoginModelEntity>> build(LoginBody params) {
    return repository.requestLogin(params);
  }
}
