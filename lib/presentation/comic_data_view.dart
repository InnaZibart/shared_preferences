import 'package:flutter/material.dart';
import 'package:logging_ts/domain/comic.dart';

class ComicDataView extends StatelessWidget {
  final List<Comic>? comics;
  const ComicDataView({Key? key, required this.comics}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (comics == null) {
      return const Center(
        child: Text("Noch keine Daten vorhanden"),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: comics!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(comics![index].title),
              subtitle: Text("Comic: ${comics![index].title}"),
            );
          });
    }
  }
}
