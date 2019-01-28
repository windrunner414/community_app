import 'package:redux/redux.dart';
import 'package:community/common/model/UserModel.dart';

final userReducer = combineReducers<UserModel>([
  TypedReducer<UserModel, UserModel>(_update),
]);

UserModel _update(UserModel user, UserModel action) {
  return action;
}