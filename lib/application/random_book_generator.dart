import 'dart:math';

import 'package:logging_ts/domain/comic.dart';

Comic generateRandomBook() {
  Random random = Random();
  return Comic(
    title: "Comic ${random.nextInt(1000)}",
  );
}
