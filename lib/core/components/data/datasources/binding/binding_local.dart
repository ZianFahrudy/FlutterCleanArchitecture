import 'package:flutter_clean_architecture/core/components/data/datasources/binding_datasources.dart';
import 'package:flutter_clean_architecture/core/storage/local_storage.dart';

class BindingLocal implements BindingDataSources {
  final SharedPrefs? prefs;

  BindingLocal(this.prefs);
}
