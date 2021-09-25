import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/exceptions/failure.dart';

abstract class UserRepository {
  Stream<Either<Failure, LoginModelEntity>> requestLogin(LoginBody body);
}
