import 'package:redux/redux.dart';
import 'package:community/common/style/theme/AppTheme.dart';

final themeReducer = combineReducers<ThemeState>([
  TypedReducer<ThemeState, RefreshTheme>(_refresh),
]);

class RefreshTheme {
  final int theme;

  RefreshTheme(this.theme);
}

ThemeState _refresh(ThemeState theme, RefreshTheme action) {
  theme.current = action.theme;
  if (AppTheme.themes[action.theme].isNightModeTheme) {
    theme.nightMode = action.theme;
  } else {
    theme.dayMode = action.theme;
  }

  return theme;
}