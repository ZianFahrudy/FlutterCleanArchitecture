import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/app/screens/login/view/login_view.dart';
import 'package:flutter_clean_architecture/app/widgets/loader/loader_widget.dart';
import 'package:flutter_clean_architecture/core/components/blocs/user/login/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
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

  setUp(() async {
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
      await tester.pumpAndSettle();

      final loginBtn = find.byKey(const Key("loginBtn"));

      expect(find.byType(LoginView), findsOneWidget);
      expect(loginBtn, findsOneWidget);

      await tester.pump();
      await tester.tap(loginBtn);

      expect(find.text("Login"), findsOneWidget);
    });

    testWidgets("LoginLoading ...", (tester) async {
      await tester.runAsync(() async {
        when(() => loginBlocMock.state).thenReturn(LoginLoading());

        await tester.pumpApp(BlocProvider<LoginBloc>(
          create: (context) => loginBlocMock,
          child: Scaffold(
            body: LoginView(loginBloc: loginBlocMock),
          ),
        ));

        await tester.pump();

        expect(find.byType(LoaderWidget), findsOneWidget);
      });
    });

    testWidgets("LoginFailure ...", (tester) async {
      await tester.runAsync(() async {
        whenListen(loginBlocMock,
            Stream.fromIterable([LoginLoading(), LoginFailure("server fail")]));

        await tester.pumpApp(BlocProvider<LoginBloc>(
          create: (context) => loginBlocMock,
          child: Scaffold(
            body: LoginView(loginBloc: loginBlocMock),
          ),
        ));

        expect(Get.isSnackbarOpen, true);
      });
    });

    testWidgets("LoginSucces ...", (tester) async {
      await tester.runAsync(() async {
        whenListen(loginBlocMock,
            Stream.fromIterable([LoginLoading(), LoginSuccess()]));

        await tester.pumpApp(BlocProvider<LoginBloc>(
          create: (context) => loginBlocMock,
          child: Scaffold(
            body: LoginView(loginBloc: loginBlocMock),
          ),
        ));

        expect(Get.currentRoute, "/HomeScreen");
      });
    });
  });
}
