import 'package:redux/redux.dart';

final themeReducer = combineReducers<int>([
  TypedReducer<int, RefreshTheme>(_refresh),
]);

class RefreshTheme {
  final int theme;

  RefreshTheme(this.theme);
}

int _refresh(int theme, RefreshTheme action) {
  return action.theme;
}