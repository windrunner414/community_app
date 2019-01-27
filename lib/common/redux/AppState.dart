import 'package:community/common/redux/ThemeReducer.dart';
import 'package:community/common/redux/UserReducer.dart';
import 'package:community/common/model/UserModel.dart';

class AppState {
  int theme;
  UserModel user;

  AppState({this.theme, this.user});
}

AppState appReducer(AppState state, action) {
  return AppState(
    theme: themeReducer(state.theme, action),
    user: userReducer(state.user, action),
  );
}

Future<AppState> restoreState() async {
  return AppState(
    theme: await restoreTheme(),
    user: await restoreUser(),
  );
}