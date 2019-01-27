import 'package:flutter/material.dart';

class AppTheme {
  static final List<AppTheme> themes = [
    AppTheme(name: '头顶的颜色', themeData: ThemeData(primarySwatch: Colors.green), isNightModeTheme: false),
    AppTheme(name: '至尊酷炫黑', themeData: ThemeData.dark(), isNightModeTheme: true),
    AppTheme(name: '最爱的颜色', themeData: ThemeData(primarySwatch: Colors.blue), isNightModeTheme: false),
  ];

  final String name;
  final ThemeData themeData;
  final bool isNightModeTheme;

  AppTheme({this.name, this.themeData, this.isNightModeTheme});

  static ThemeData getThemeData(int id) {
    return themes[id].themeData;
  }
}