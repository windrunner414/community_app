import 'package:community/common/redux/ThemeReducer.dart';
import 'package:community/common/redux/UserReducer.dart';
import 'package:community/common/model/UserModel.dart';

class AppState {
  int theme;
  UserModel user;

  AppState({this.theme, this.user});

  static final AppState initialState = AppState(
    theme: 0,
    user: UserModel(
      avatar: 'assets://resource/images/user/defaultAvatar.jpg',
      username: '未登录',
    ),
  );

  Map<String, dynamic> toJson() => {
    'theme': theme,
    'user': user,
  };

  AppState.fromJson(Map<String, dynamic> json) :
    theme = json['theme'],
    user = UserModel.fromJson(json['user']);
}

AppState appReducer(AppState state, action) {
  return AppState(
    theme: themeReducer(state.theme, action),
    user: userReducer(state.user, action),
  );
}