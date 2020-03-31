

import 'package:starwars/core/services/film/model/list_films.response.dart';

class FilmModel {
  String title;
  int episodeId;
  String imgFilm;
  String openingCrawl;
  String director;
  String producer;
  String releaseDate;

  FilmModel({
    this.title = '',
    this.episodeId = 0,
    this.imgFilm = '',
    this.openingCrawl = '',
    this.director = '',
    this.producer = '',
    this.releaseDate = '',
  });

  factory FilmModel.fromFilmResponse(FilmResponse response) {
    return FilmModel(
        title: response.title,
        episodeId: response.episodeId,
        imgFilm: response.imgFilm,
        openingCrawl: response.openingCrawl,
        director: response.director,
        producer: response.producer,
        releaseDate: response.releaseDate
    );
  }
}