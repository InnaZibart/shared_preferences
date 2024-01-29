import 'package:logging_ts/domain/comic.dart';

abstract class DatabaseRepository {
  Future<void> createComicList(List<Comic> comics);
  Future<List<Comic>?> readComicList();
  Future<bool> updateComicList(List<Comic> comics);
  Future<void> deleteComicList();
}
