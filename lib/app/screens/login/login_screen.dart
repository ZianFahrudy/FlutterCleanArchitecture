import 'package:flutter/material.dart';

import '../../../core/components/blocs/user/login/login_bloc.dart';
import '../../../core/di/injection_container.dart';
import 'view/login_view.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginBloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: LoginView(loginBloc: loginBloc));
  }
}
