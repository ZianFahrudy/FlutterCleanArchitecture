import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/key_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/storage/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final prefs = sl<SharedPrefs>();

  late String token;

  @override
  void initState() {
    token = prefs.getString(KeyConstants.keyAccessToken) ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen"),
            Text(token),
          ],
        ),
      ),
    );
  }
}
