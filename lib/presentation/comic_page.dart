import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logging_ts/domain/comic.dart';
import 'package:logging_ts/presentation/comic_data_view.dart';
import 'package:logging_ts/presentation/sizes.dart';
import '../data/data_repository.dart';

class ParticipantsPage extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const ParticipantsPage({
    super.key,
    required this.databaseRepository,
  });

  @override
  State<ParticipantsPage> createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  // Anfangs ist die Liste der Teilnehmer null
  List<Comic>? participants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Center(
            child: Column(
              children: [
                // ComicDataView(comics: comics),
                Sizes.gapH32,
                ElevatedButton(
                  onPressed: () async {
                    await widget.databaseRepository.createComicList([]);
                  },
                  child: const Text("Create List"),
                ),
                Sizes.gapH16,
                ElevatedButton(
                  onPressed: () async {
                    final List<Comic>? list =
                        await widget.databaseRepository.readComicList();
                    setState(() {
                      participants = list;
                    });
                  },
                  child: const Text("Read List"),
                ),
                Sizes.gapH16,
                ElevatedButton(
                    onPressed: () async {
                      Comic comic = generateRandomComic();
                      await widget.databaseRepository.updateComicList([comic]);
                    },
                    child: const Text("Update List")),
                Sizes.gapH16,
                ElevatedButton(
                  onPressed: () async {
                    await widget.databaseRepository.deleteComicList();
                  },
                  child: const Text("Delete List"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Comic generateRandomComic() {
    Random random = Random();
    return Comic(
      title: "Comic ${random.nextInt(1000)}",
    );
  }
}
