import 'package:flutter/material.dart';

class AppTheme {
  static final List<AppTheme> themes = [
    AppTheme(name: '头顶的颜色', themeData: ThemeData(primarySwatch: Colors.green)),
    AppTheme(name: '至尊酷炫黑', themeData: ThemeData.dark()),
    AppTheme(name: '最爱的颜色', themeData: ThemeData(primarySwatch: Colors.blue)),
  ];

  final String name;
  final ThemeData themeData;

  AppTheme({this.name, this.themeData});

  static ThemeData getThemeData(int id) {
    return themes[id].themeData;
  }
}