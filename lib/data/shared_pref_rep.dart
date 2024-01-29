import 'package:logging_ts/data/data_repo_service.dart';
import 'package:logging_ts/data/data_repository.dart';
import 'package:logging_ts/domain/comic.dart';

class SharedPrefsRepository implements DatabaseRepository {
  final SharedPrefsService _sharedPrefsService;

  SharedPrefsRepository(this._sharedPrefsService);

  @override
  Future<void> createComicList(List<Comic> comics) async {
    return _sharedPrefsService.createComicList(comics);
  }

  @override
  Future<List<Comic>?> readComicList() {
    return _sharedPrefsService.readComicList();
  }

  @override
  Future<bool> updateComicList(List<Comic> comics) async {
    return _sharedPrefsService.updateComicList(comics);
  }

  @override
  Future<void> deleteComicList() async {
    return _sharedPrefsService.deleteComicList();
  }
}
