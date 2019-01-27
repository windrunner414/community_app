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

class _UserCenterDrawerPageState extends State<UserCenterDrawerPage> with AutomaticKeepAliveClientMixin {
  @override
  get wantKeepAlive => true;

  int lastSwitchedTheme = -1;

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
              StoreConnector<AppState, int>(
                converter: (store) => store.state.theme,
                builder: (context, int theme) {
                  bool isNightMode = AppTheme.themes[theme].isNightModeTheme;

                  return IconButton(
                    icon: isNightMode ? Icon(Icons.lightbulb_outline) : Icon(Icons.highlight),
                    onPressed: () {
                      bool switchToNightMode = !isNightMode;
                      int switchTo = 0;

                      if (lastSwitchedTheme > -1
                          && AppTheme.themes[lastSwitchedTheme].isNightModeTheme == switchToNightMode) {
                        switchTo = lastSwitchedTheme;
                      } else {
                        for (int i = 0; i < AppTheme.themes.length; ++i) {
                          if (AppTheme.themes[i].isNightModeTheme == switchToNightMode) {
                            switchTo = i;
                            break;
                          }
                        }
                      }

                      StoreProvider.of<AppState>(context).dispatch(RefreshTheme(switchTo));
                      lastSwitchedTheme = theme;
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