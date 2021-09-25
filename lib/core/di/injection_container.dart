import 'package:flutter_clean_architecture/core/components/blocs/user/bloc/login_bloc.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_local.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/binding/binding_remote.dart';
import 'package:flutter_clean_architecture/core/components/data/datasources/common/datasource_factory.dart';
import 'package:flutter_clean_architecture/core/components/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architecture/core/components/domains/repository/user_repository.dart';
import 'package:flutter_clean_architecture/core/components/domains/usecases/login_usecase.dart';
import 'package:flutter_clean_architecture/core/network/http_client.dart';
import 'package:flutter_clean_architecture/core/storage/local_storage.dart';
import 'package:flutter_clean_architecture/env/config.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  late final config = Config.getInstance();
  final prefs = await SharedPrefs.getInstance();

  // [flavor]
  /// implementation flavor with different [environment] both ios and android
  sl.registerLazySingleton(() => config);

  ///[local storage]
  ///save data to local with with share_prefs
  sl.registerLazySingleton(() => prefs);

  /// [network]
  /// setup to make dio injection called on [binding data] both [local] or [remote]
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerLazySingleton(() => HttpClient(config: sl(), prefs: sl()));

  ///[another service]
  ///setup another service such push notification deep link and other
  // sl.registerLazySingleton(() => NotificationService());
  // sl.registerLazySingleton(() => DynamicLink());

  /// [data]
  /// some component must be called on this file [binding]
  /// and implement binding [DataSource]
  sl.registerFactory(() => BindingLocal(sl()));
  sl.registerFactory(() => BindingRemote(sl()));

  /// [repository]
  /// implement more repository can pass in here
  /// with some [method] and [function]
  sl.registerFactory(() => BindingDataSourceFactory(
        bindingRemote: sl(),
        bindingLocal: sl(),
      ));
  // sl.registerFactory<AppRepository>(() => AppRepositoryImpl(sl()));
  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(sl()));

  /// [useCase]
  ///define request to dataSource
  sl.registerFactory(() => LoginUseCase(sl()));
  // sl.registerFactory(() => GetPreferredLanguageUseCase(sl()));

  /// [blocs]
  ///define request to useCase
  // sl.registerFactory(
  //   () => LanguageBloc(
  //     getPreferredLanguage: sl(),
  //     updateLanguage: sl(),
  //   ),
  // );
  // sl.registerFactory(() => ToggleDrawerCubit());
  sl.registerFactory(() => LoginBloc(sl()));
}
