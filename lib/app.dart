import 'package:flutter/material.dart';

import 'data/data_repo_service.dart';
import 'data/data_repository.dart';
import 'data/shared_pref_rep.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final DatabaseRepository databaseRepository //= JsonRepository(JsonService());
      = SharedPrefsRepository(SharedPrefsService());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BooksPage(databaseRepository: databaseRepository),
      // unsere App hat nur eine Seite, die ParticipantsPage
      // dieser geben wir das databaseRepository mit
      // (ob es nun JsonRepository oder SharedPrefsRepository ist, ist egal)
    );
  }
}
