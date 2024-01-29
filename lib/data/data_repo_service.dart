import 'dart:convert';

import 'package:logging_ts/domain/comic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String _key = "comics";
  //CRUD
  //Create
  Future<void> createComicList(List<Comic> comics) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList(
        _key, comics.map((e) => jsonEncode(e.toJson())).toList());
  }

  //Read
  Future<List<Comic>?> readComicList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final List<String>? jsonList = pref.getStringList(_key);

    return jsonList?.map((e) => Comic.fromJson(jsonDecode(e))).toList();
  }

  //Update
  Future<bool> updateComicList(List<Comic> comics) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final storedList = await readComicList();
    if (storedList == null) {
      return false;
    }
    List<Comic> newList = [...storedList, ...comics];
    return pref.setStringList(
        _key, newList.map((e) => jsonEncode(e.toJson())).toList());
  }

  //Delete
  Future<void> deleteComicList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(_key);
  }
}
