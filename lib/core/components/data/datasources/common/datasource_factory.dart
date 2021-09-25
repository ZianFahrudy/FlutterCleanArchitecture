import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_local.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_remote.dart';

import '../binding_datasources.dart';
import 'base_datasource_factory.dart';

class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSources?> {
  BindingDataSourceFactory({
    required BindingRemote bindingRemote,
    required BindingLocal bindingLocal,
  })  : _bindingRemote = bindingRemote,
        _bindingLocal = bindingLocal;

  final BindingRemote? _bindingRemote;
  final BindingLocal? _bindingLocal;

  @override
  BindingDataSources? createData(DataSourceState dataSourceState) {
    switch (dataSourceState) {
      case DataSourceState.local:
        return _bindingLocal;
      case DataSourceState.network:
        return _bindingRemote;
      default:
        throw UnsupportedError(
          'DataSourceState $dataSourceState is not applicable in BindingDataSourceFactory',
        );
    }
  }
}
