import 'package:redux/redux.dart';
import 'package:community/common/utils/LocalStorage.dart';

Future<int> restoreTheme() async {
  return await LocalStorage.getInt('theme') ?? 0;
}

Future<bool> saveTheme(int theme) {
  return LocalStorage.setInt('theme', theme);
}

final themeReducer = combineReducers<int>([
  TypedReducer<int, RefreshTheme>(_refresh),
]);

class RefreshTheme {
  final int theme;

  RefreshTheme(this.theme);
}

int _refresh(int theme, RefreshTheme action) {
  saveTheme(action.theme).catchError((e) {
    // save failed
  });

  return action.theme;
}