class Film {
  String title;
  String director;
  String producer;
  String releaseDate;
  String openingCrawl;
  List<String> characters;

  Film({
    required this.title,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.openingCrawl,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
      openingCrawl: json['opening_crawl'],
      characters: List<String>.from(
        json['characters'],
      ),
    );
  }
}
