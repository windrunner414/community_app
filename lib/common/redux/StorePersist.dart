import 'package:redux/redux.dart';
import 'dart:convert';
import 'package:community/common/utils/LocalStorage.dart';

final String storePersistKey = '_persist_store';

void persistStore(Store store) {
  store.onChange.listen((state) async {
    String jsonString = json.encode(state);
    if (jsonString != await LocalStorage.getString(storePersistKey)) {
      await LocalStorage.setString(storePersistKey, jsonString);
    }
  });
}

Future<Map<String, dynamic>> getStorePersistData() async {
  String jsonString = await LocalStorage.getString(storePersistKey);
  if (jsonString == null) {
    return null;
  }

  return json.decode(jsonString);
}