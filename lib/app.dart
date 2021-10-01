import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/app/screens/login/login_screen.dart';
import 'package:flutter_clean_architecture/core/components/blocs/user/login/login_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'core/di/injection_container.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final loginBloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: GetMaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
