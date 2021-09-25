import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/binding_datasources.dart';
import 'package:flutter_clean_architecture/core/components/data/models/response/login_model.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/constants/api_path.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/storage/local_storage.dart';

class BindingRemote implements BindingDataSources {
  late final Dio _client;

  BindingRemote(this._client);

  SharedPrefs prefs = sl<SharedPrefs>();

  @override
  Stream<LoginModelEntity> requestLogin(LoginBody body) async* {
    final Response response =
        await _client.post(ApiPath.login, data: body.toJson());

    yield LoginModel.fromJson(response.data);
  }
}
