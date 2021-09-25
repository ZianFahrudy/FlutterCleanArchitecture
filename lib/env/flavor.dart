import 'package:flutter/material.dart';

import 'config.dart';

/// * This file is configuration to make separate between environment
/// * see details about [flutter flavor]
class FlavorSettings {
  /// support api and flavor
  FlavorSettings.sman2bantuldev() {
    Config.getInstance(
      flavorName: 'development',
      packageName: 'com.zian.foodshop',
      apiBaseUrl: 'http://dev-url',
      socketUrl: 'https://client.socket.zian.my.id',
      socketToken: 'KjdEhsksOe',
      apiSentry: 'http://sentry-url',
      assetsUri: 'assets/img/foodshop',
      uriPrefix: 'https://fooshop.page.link',
      accentColor: Color(0xFF95D16F),
      primaryColor: Color(0xFF5FA036),
      primaryColorLight: Color(0xFF8EE359),
      primaryColorDark: Color(0xFF406e23),
      secondaryColorDark: Color(0xFF30521A),
    );
  }

  FlavorSettings.sman2bantulstag() {
    Config.getInstance(
      flavorName: 'staging',
      packageName: 'com.zian.foodshop',
      apiBaseUrl: 'http://dev-stag',
      socketUrl: 'https://client.socket.zian.my.id',
      socketToken: 'KjdEhsksOe',
      apiSentry: 'http://sentry-url',
      assetsUri: 'assets/img/foodshop',
      uriPrefix: 'https://fooshop.page.link',
      accentColor: Color(0xFF95D16F),
      primaryColor: Color(0xFF5FA036),
      primaryColorLight: Color(0xFF8EE359),
      primaryColorDark: Color(0xFF406e23),
      secondaryColorDark: Color(0xFF30521A),
    );
  }

  FlavorSettings.sman2bantul() {
    Config.getInstance(
      flavorName: 'production',
      packageName: 'com.zian.foodshop',
      apiBaseUrl: 'http://dev-prod',
      socketUrl: 'https://client.socket.zian.my.id',
      socketToken: 'KjdEhsksOe',
      apiSentry: 'http://sentry-url',
      assetsUri: 'assets/img/foodshop',
      uriPrefix: 'https://fooshop.page.link',
      accentColor: Color(0xFF95D16F),
      primaryColor: Color(0xFF5FA036),
      primaryColorLight: Color(0xFF8EE359),
      primaryColorDark: Color(0xFF406e23),
      secondaryColorDark: Color(0xFF30521A),
    );
  }
}
