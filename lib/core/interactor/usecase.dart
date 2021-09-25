import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../exceptions/failure.dart';

abstract class UseCase<Type, Params> {
  Stream<Either<Failure, Type>> build(Params params);

  Stream<Either<Failure, Type>> execute(Params params) {
    return build(params).onErrorResume((error, stack) {
      Failure failure;
      if (error is Failure) {
        failure = error;
      } else if (error is DioError) {
        if (error.response!.statusCode! < 500) {
          failure =
              ServerFailure(message: error.response!.data['meta']['message']);
        } else {
          final message = error.response!.data['meta']['message'];
          failure = ServerFailure(message: message);
        }
      } else {
        failure = AnotherFailure(message: error.toString());
      }
      return Stream.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
