import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/domains/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/core/constants/key_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/exceptions/failure.dart';
import 'package:flutter_clean_architecture/core/storage/local_storage.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SharedPrefs prefs = sl<SharedPrefs>();

  final LoginUseCase loginUseCase;
  LoginBloc(this.loginUseCase) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is OnLoginEvent) {
      yield LoginLoading();

      final Stream<Either<Failure, LoginModelEntity>> response =
          loginUseCase.execute(event.body);

      await for (final eventRes in response) {
        yield* eventRes.fold((error) async* {
          yield LoginFailure(error.message);
        }, (values) async* {
          prefs.putString(
              KeyConstants.keyAccessToken, values.data!.accessToken!);
          yield LoginSuccess();
        });
      }
    }
  }
}
