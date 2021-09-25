import 'package:flutter_clean_architecture/core/components/data/datasources/binding_datasources.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';
import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/storage/local_storage.dart';

class BindingLocal implements BindingDataSources {
  final SharedPrefs? prefs;

  BindingLocal(this.prefs);

  @override
  Stream<LoginModelEntity> requestLogin(LoginBody body) {
    throw UnimplementedError();
  }
}
