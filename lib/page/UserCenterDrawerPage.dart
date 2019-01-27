import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:community/common/redux/AppState.dart';
import 'package:community/common/model/UserModel.dart';
import 'package:community/common/utils/ImageUtils.dart';
import 'package:community/common/widget/UserCenterDrawer.dart';

class UserCenterDrawerPage extends StatefulWidget {
  @override
  _UserCenterDrawerPageState createState() => _UserCenterDrawerPageState();
}

class _UserCenterDrawerPageState extends State<UserCenterDrawerPage> with AutomaticKeepAliveClientMixin {
  @override
  get wantKeepAlive => true;

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
          action: Row(
            children: <Widget>[

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