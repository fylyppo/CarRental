import 'package:flutter/material.dart';

enum AppTheme {
  Light,
  Dark,
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    cardColor: Colors.white,
    dividerColor: Colors.grey[700],
    shadowColor: Colors.grey.withOpacity(0.4),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
    cardColor: Colors.grey[700],
    dividerColor: Colors.black,
    shadowColor: Colors.black.withOpacity(0.4),
  ),
};