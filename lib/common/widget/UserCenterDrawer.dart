import 'package:flutter/material.dart';

class UserCenterDrawer extends StatelessWidget {
  final ImageProvider avatar;
  final Widget userName;
  final Widget userInfo;
  final Widget child;
  final Widget action;
  final Decoration decoration;
  final VoidCallback onDetailsPressed;

  UserCenterDrawer({
    Key key,
    @required this.avatar,
    @required this.userName,
    @required this.userInfo,
    @required this.child,
    this.action,
    this.decoration,
    this.onDetailsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsetsDirectional.only(top: 35.0, start: 15.0),
            decoration: decoration ?? BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GestureDetector(
                  onTap: onDetailsPressed,
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: avatar,
                        radius: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            color: Theme.of(context).primaryTextTheme.body2.color,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          child: userName,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.body1.color,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    child: userInfo,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: child,
          ),
          Container(
            child: action,
          )
        ],
      ),
    );
  }
}