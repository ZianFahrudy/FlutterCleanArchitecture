import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/app.dart';
import 'package:flutter_clean_architecture/env/flavor.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart'
    as di;
import 'core/utility/observer.dart';
import 'env/config.dart';

///[get debug mode]
bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

void main() {
  /// [Catch some error]
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  /// [init sentry event]
  SentryEvent processTagEvent(SentryEvent event, {dynamic hint}) =>
      event..tags!.addAll({'page-locale': 'id_ID'});

  /// [run apps] with catch error
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = MyBlocObserver();
    await getFlavorSetting();
    await di.init();
    await disableLandscapeMode();
    // await Firebase.initializeApp();
    disableErrorWidget();
    // await Sentry.init(
    //   (options) => options
    //     ..addEventProcessor(processTagEvent)
    //     ..attachStacktrace = false
    //     ..attachThreads = false,
    //   appRunner: () => runApp(MyApp()),
    // );
    runApp(MyApp());

    ///[console] flavor running
    if (!kReleaseMode) {
      final settings = Config.getInstance();
      print('🚀 APP FLAVOR NAME      : ${settings.flavorName}');
      print('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}');
      print('🚀 APP API_SENTRY       : ${settings.apiSentry}');
    }
  }, (e, s) async {
    if (isInDebugMode) {
      print('🔴 In dev mode. Not sending report.');
      print("ERROR :$e");
      print("STACKTRACE :$s");
    } else {
      print("🔴 OTHER_ERROR   :$e");
      print("🔴 STACKTRACE    :$s");
    }
  });
}

/// [disable error] widget when [release mode]
void disableErrorWidget() {
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      print('Error widget triggered on :${details.exception}');
      print(details.stack.toString());
      return Container();
    };
  }
}

/// [disable landscape] model
Future<void> disableLandscapeMode() async {
  await SystemChrome.setPreferredOrientations(([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]));
}

///[environment] configuration
Future<FlavorSettings> getFlavorSetting() async {
  final flavor =
      await MethodChannel('flavor').invokeMethod<String>('getFlavor');
  switch (flavor) {
    case "foodshopdev":
      return FlavorSettings.foodshopdev();
    case "foodshopstag":
      return FlavorSettings.foodshopstag();
    case "foodshopprod":
      return FlavorSettings.foodshop();

    default:
      throw Exception("㊗️ Oopss... Flavor name missing");
  }
}
