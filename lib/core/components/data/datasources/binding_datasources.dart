import 'package:flutter_clean_architecture/core/components/data/models/request/login_body.dart';
import 'package:flutter_clean_architecture/core/components/domains/entities/response/login_model_entity.dart';

abstract class BindingDataSources {
  /// [AUTH]
  ///

  Stream<LoginModelEntity> requestLogin(LoginBody body);
}
