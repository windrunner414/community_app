import 'package:flutter/material.dart';
import 'package:community/common/widget/BottomNavButton.dart';

typedef BottomNavBarTapCallback = void Function(int index);

class BottomNavBar extends StatelessWidget {
  final BottomNavBarTapCallback onTap;
  final int currentIndex;
  final List<BottomNavBarItem> items;
  final NotchedShape shape;
  final double notchMargin;
  final double height;

  BottomNavBar({
    Key key,
    this.onTap,
    this.currentIndex = 0,
    this.items,
    this.shape,
    this.notchMargin,
    this.height = 50.0,
  }) : assert(currentIndex < items.length),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomNavBarItems = [];
    for (int i = 0; i < items.length; ++i) {
      bottomNavBarItems.add(BottomNavButton(
        active: i == currentIndex,
        icon: items[i].icon,
        activeIcon: items[i].activeIcon,
        text: items[i].text,
        onTap: () => onTap(i),
      ));
    }

    return BottomAppBar(
      shape: shape,
      notchMargin: notchMargin,
      child: Container(
        height: height,
        child: Row(
          children: bottomNavBarItems,
        ),
      ),
    );
  }
}

class BottomNavBarItem {
  final Widget icon;
  final Widget activeIcon;
  final Widget text;

  BottomNavBarItem({@required this.icon, this.activeIcon, @required this.text});
}