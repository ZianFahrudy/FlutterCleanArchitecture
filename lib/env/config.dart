import 'package:flutter/material.dart';

class Config {
  Config({
    this.flavorName,
    this.packageName,
    this.apiBaseUrl,
    this.socketUrl,
    this.socketToken,
    this.apiSentry,
    this.assetsUri,
    this.uriPrefix,
    this.primaryColor,
    this.primaryColorDark,
    this.primaryColorLight,
    this.accentColor,
    this.secondaryColorDark,
  });

  final String? flavorName;
  final String? packageName;
  final String? apiBaseUrl;
  final String? socketUrl;
  final String? socketToken;
  final String? apiSentry;
  final String? assetsUri;
  final String? uriPrefix;
  final Color? primaryColor;
  final Color? primaryColorDark;
  final Color? primaryColorLight;
  final Color? accentColor;
  final Color? secondaryColorDark;

  static Config? _instance;

  static Config getInstance({
    dynamic flavorName,
    dynamic packageName,
    dynamic apiBaseUrl,
    dynamic socketUrl,
    dynamic socketToken,
    dynamic apiSentry,
    dynamic assetsUri,
    dynamic uriPrefix,
    Color? accentColor,
    Color? primaryColor,
    Color? primaryColorDark,
    Color? primaryColorLight,
    Color? secondaryColorDark,
  }) {
    if (_instance == null) {
      _instance = Config(
        flavorName: flavorName,
        packageName: packageName,
        apiBaseUrl: apiBaseUrl,
        socketUrl: socketUrl,
        socketToken: socketToken,
        apiSentry: apiSentry,
        assetsUri: assetsUri,
        uriPrefix: uriPrefix,
        accentColor: accentColor,
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        primaryColorLight: primaryColorLight,
        secondaryColorDark: secondaryColorDark,
      );
      return _instance!;
    }
    return _instance!;
  }
}
