import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/binding_datasources.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/storage/local_storage.dart';

class BindingRemote implements BindingDataSources {
  late final Dio _client;

  BindingRemote(this._client);

  SharedPrefs prefs = sl<SharedPrefs>();
}
