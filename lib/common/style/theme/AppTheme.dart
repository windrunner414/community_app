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

  AppTheme({@required this.name, @required this.themeData, @required this.isNightModeTheme});

  static ThemeData getThemeData(int id) {
    return themes[id].themeData;
  }
}

class ThemeState {
  int current;
  int dayMode;
  int nightMode;

  ThemeState() :
    current = 0, // default theme
    dayMode = 0, // default day mode theme
    nightMode = 1; // default night mode theme

  Map<String, dynamic> toJson() => {
    'current': current,
    'dayMode': dayMode,
    'nightMode': nightMode,
  };

  ThemeState.fromJson(Map<String, dynamic> json) :
    current = json['current'],
    dayMode = json['dayMode'],
    nightMode = json['nightMode'];
}