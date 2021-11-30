import 'package:flutter_clean_architecture/app/screens/home/home_screen.dart';

import 'package:get/get.dart';

import '../lib/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Test the end to end", (tester) async {
    // await tester.runAsync(() async {
    app.main();

    await tester.pumpAndSettle();

    final Finder loginBtn = find.byKey(const Key('loginBtn'));
    final Finder emailField = find.byKey(const Key('emailField'));
    final Finder passwordField = find.byKey(const Key('passwordField'));

    /// [Condition 1: email and password wrong] Login Failure
    /// tap email field
    await tester.tap(emailField);
    await tester.enterText(emailField, "kuda@gmail.com");

    /// tap password field
    await tester.tap(passwordField);
    await tester.enterText(passwordField, "12345s678");

    await tester.tap(loginBtn);
    await tester.pumpAndSettle();

    expect(Get.isSnackbarOpen, true);

    /// [Condition 2: email and password right ] Login Success

    /// tap email field
    await tester.tap(emailField);
    await tester.enterText(emailField, "kambingimut@gmail.com");

    /// tap password field
    await tester.tap(passwordField);
    await tester.enterText(passwordField, "12345678");

    /// tap login button
    await tester.tap(loginBtn);

    await tester.pumpAndSettle();

    /// find home screen if login success
    expect(find.byType(HomeScreen), findsOneWidget);

    // });
  });
}
