import 'package:flutter/material.dart';

import 'config.dart';

/// * This file is configuration to make separate between environment
/// * see details about [flutter flavor]
class FlavorSettings {
  /// support api and flavor
  FlavorSettings.foodshopdev() {
    Config.getInstance(
      flavorName: 'foodshopdev',
      packageName: 'com.zian.foodshop',
      apiBaseUrl: 'http://foodmarket-backend.buildwithangga.id',
      accentColor: Color(0xFF95D16F),
      primaryColor: Color(0xFF5FA036),
      primaryColorLight: Color(0xFF8EE359),
      primaryColorDark: Color(0xFF406e23),
      secondaryColorDark: Color(0xFF30521A),
    );
  }

  FlavorSettings.foodshopstag() {
    Config.getInstance(
      flavorName: 'foodshopstag',
      packageName: 'com.zian.foodshop',
      apiBaseUrl: 'http://foodmarket-backend.buildwithangga.id',
      accentColor: Color(0xFF95D16F),
      primaryColor: Color(0xFF5FA036),
      primaryColorLight: Color(0xFF8EE359),
      primaryColorDark: Color(0xFF406e23),
      secondaryColorDark: Color(0xFF30521A),
    );
  }

  FlavorSettings.foodshop() {
    Config.getInstance(
      flavorName: 'foodshopprod',
      packageName: 'com.zian.foodshop',
      apiBaseUrl: 'http://foodmarket-backend.buildwithangga.id',
      accentColor: Color(0xFF95D16F),
      primaryColor: Color(0xFF5FA036),
      primaryColorLight: Color(0xFF8EE359),
      primaryColorDark: Color(0xFF406e23),
      secondaryColorDark: Color(0xFF30521A),
    );
  }
}
