
import 'package:starwars/core/services/film/model/list_films.response.dart';
import 'package:starwars/modules/home/model/film_model.dart';

class ListFilmsModel {
    int count;
    List<FilmModel> films;

    ListFilmsModel({
      this.count = 0,
      // ignore: avoid_init_to_null
      this.films = null });

    factory ListFilmsModel.fromFilmsResponse( ListFilmsResponse response) {
      return ListFilmsModel(
          count: response.count,
          films: response.films.map((i) => FilmModel.fromFilmResponse(i)).toList()
      );
    }
}
