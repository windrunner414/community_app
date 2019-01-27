import 'package:flutter/material.dart';

class SnackBarHelper {
  static void show({
    Key key,
    @required ScaffoldState scaffoldState,
    @required Widget content,
    Color backgroundColor,
    SnackBarAction action,
    Duration duration = const Duration(milliseconds: 2000),
    Animation<double> animation,
  }) {
    final SnackBar snackBar = SnackBar(
      key: key,
      content: content,
      backgroundColor: backgroundColor,
      action: action,
      duration: duration,
      animation: animation,
    );
    scaffoldState.showSnackBar(snackBar);
  }
}