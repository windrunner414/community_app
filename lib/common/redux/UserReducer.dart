import 'package:redux/redux.dart';
import 'package:community/common/model/UserModel.dart';
import 'package:community/common/utils/LocalStorage.dart';

Future<UserModel> restoreUser() async {
  String json = await LocalStorage.getString('user');
  if (json == null) {
    return UserModel(
      avatar: 'assets://resource/images/user/defaultAvatar.jpg',
      username: '游客',
    );
  } else {

  }
}

final userReducer = combineReducers<UserModel>([
  TypedReducer<UserModel, UserModel>(_update),
]);

UserModel _update(UserModel user, UserModel action) {
  return action;
}