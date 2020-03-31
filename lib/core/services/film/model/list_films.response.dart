import 'package:starwars/core/data/remote/models/base_response.dart';

class ListFilmsResponse extends BaseResponse {
    final int count;
    final List<FilmResponse> films;

    ListFilmsResponse.empty()
        : count = 0,
          films = null;

    ListFilmsResponse({this.count, this.films});

    factory ListFilmsResponse.fromJson(Map<String, dynamic> jsonParsed) {
        return ListFilmsResponse(
            count: jsonParsed['count'] ?? 0,
            films: (jsonParsed['results'] as List).map((i) => FilmResponse.fromJson(i)).toList()
        );
    }
}

class FilmResponse {
    String title;
    int episodeId;
    String imgFilm;
    String openingCrawl;
    String director;
    String producer;
    String releaseDate;

    FilmResponse.fromJson(Map<String, dynamic> json)
        : title = json['title'] ?? '',
          episodeId = json['episode_id'] ?? 0,
          imgFilm = json['url'] ?? '',
          openingCrawl = json['opening_crawl'] ?? '',
          director = json['director'] ?? '',
          producer = json['producer'] ?? '',
          releaseDate = json['release_date'] ?? '';
}