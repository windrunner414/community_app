import 'package:community/common/redux/ThemeReducer.dart';
import 'package:community/common/redux/UserReducer.dart';
import 'package:community/common/model/UserModel.dart';
import 'package:community/common/style/theme/AppTheme.dart';

class AppState {
  ThemeState theme;
  UserModel user;

  AppState({this.theme, this.user});

  static final AppState initialState = AppState(
    theme: ThemeState(),
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
    theme = ThemeState.fromJson(json['theme']),
    user = UserModel.fromJson(json['user']);
}

AppState appReducer(AppState state, action) {
  return AppState(
    theme: themeReducer(state.theme, action),
    user: userReducer(state.user, action),
  );
}