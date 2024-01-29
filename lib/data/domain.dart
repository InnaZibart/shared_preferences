class Books {
  final String name;
  final String description;
  final String genre;
  final int pages;

  Books({
    required this.name,
    required this.description,
    required this.genre,
    required this.pages,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "genre": genre,
      "pages": pages,
    };
  }

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
        name: json["name"],
        description: json["description"],
        genre: json["genre"],
        pages: json["pages"]);
  }
}
