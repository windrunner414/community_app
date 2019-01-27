import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  final bool active;
  final Widget icon;
  final Widget activeIcon;
  final Widget text;
  final GestureTapCallback onTap;

  BottomNavButton({
    Key key,
    this.active = false,
    @required this.icon,
    this.activeIcon,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == null || icon == null) {
      return Expanded(flex: 1, child: Container()); // placeholder
    }

    ThemeData themeData = Theme.of(context);

    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  color: active ? themeData.accentColor : themeData.textTheme.display1.color,
                  size: 22,
                ),
                child: active ? (activeIcon ?? icon) : icon,
              ),
              DefaultTextStyle(
                child: text,
                style: TextStyle(
                  fontSize: 12,
                  color: active ? themeData.accentColor : themeData.textTheme.display1.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}