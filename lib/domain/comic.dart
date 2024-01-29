class Comic {
  final String title;

  Comic({required this.title});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
    };
  }

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(title: json["title"]);
  }
}
