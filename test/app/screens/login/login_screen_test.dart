import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/app/screens/login/login_screen.dart';
import 'package:flutter_clean_architecture/app/screens/login/view/login_view.dart';
import 'package:flutter_clean_architecture/core/components/blocs/user/login/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helper/pump_app.dart';

class LoginBlocMock extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class LoginEventFake extends Fake implements LoginEvent {}

class LoginStateFake extends Fake implements LoginState {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late LoginBlocMock loginBlocMock;
  setUpAll(() {
    registerFallbackValue<LoginEvent>(LoginEventFake());
    registerFallbackValue<LoginState>(LoginStateFake());
  });

  setUp(() {
    loginBlocMock = LoginBlocMock();
    when(() => loginBlocMock.state).thenReturn(LoginInitial());
  });

  group("Widget testing", () {
    testWidgets('login screen ...', (tester) async {
      await tester.pumpApp(BlocProvider<LoginBloc>(
        create: (context) => loginBlocMock,
        child: Scaffold(
            body: LoginView(
          loginBloc: loginBlocMock,
        )),
      ));

      final loginBtn = find.byKey(const Key("loginBtn"));

      expect(find.byType(LoginView), findsOneWidget);
      expect(loginBtn, findsOneWidget);

      await tester.pump();
      await tester.tap(loginBtn);

      expect(find.text("Login"), findsOneWidget);
    });
  });
}
