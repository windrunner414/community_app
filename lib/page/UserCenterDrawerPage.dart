import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:community/common/redux/AppState.dart';
import 'package:community/common/model/UserModel.dart';
import 'package:community/common/utils/ImageHelper.dart';
import 'package:community/common/widget/UserCenterDrawer.dart';
import 'package:community/common/style/theme/AppTheme.dart';
import 'package:community/common/redux/ThemeReducer.dart';

class UserCenterDrawerPage extends StatefulWidget {
  @override
  _UserCenterDrawerPageState createState() => _UserCenterDrawerPageState();
}

class _UserCenterDrawerPageState extends State<UserCenterDrawerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserModel>(
      converter: (store) => store.state.user,
      builder: (context, UserModel user) {
        return UserCenterDrawer(
          avatar: getImageProvider(user.avatar),
          userName: Text(user.username),
          userInfo: Text('邪王真眼は最高です'),
          child: ListView(
            children: <Widget>[
              ListTile(leading: Icon(Icons.settings), title: Text('我的问答')),
            ],
          ),
          action: ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  
                },
              ),
              StoreConnector<AppState, ThemeState>(
                converter: (store) => store.state.theme,
                builder: (context, ThemeState theme) {
                  bool isNightMode = theme.current == theme.nightMode;

                  return IconButton(
                    icon: isNightMode ? Icon(Icons.lightbulb_outline) : Icon(Icons.highlight),
                    onPressed: () {
                      StoreProvider.of<AppState>(context)
                        .dispatch(RefreshTheme(isNightMode ? theme.dayMode : theme.nightMode));
                    },
                  );
                },
              ),
            ],
          ),
          onDetailsPressed: () {
            debugPrint('ondetail');
          },
        );
      },
    );
  }
}