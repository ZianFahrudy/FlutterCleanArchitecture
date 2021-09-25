import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/screens/login/login_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginScreen(),
    );
  }
}
