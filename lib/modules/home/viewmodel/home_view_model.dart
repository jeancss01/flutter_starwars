
import 'package:starwars/core/enums/viewstate.dart';
import 'package:starwars/core/models/list_films_model.dart';
import 'package:starwars/core/services/film/film_service.dart';
import 'package:starwars/core/services/film/model/list_films.response.dart';
import 'package:starwars/core/viewmodels/base_view_model.dart';
import 'package:starwars/locator.dart';
import 'package:starwars/modules/home/model/film_model.dart';

class HomeViewModel extends BaseViewModel {
  final _service = locator<FilmService>();

  List<FilmModel> _films = List<FilmModel>();

  List<FilmModel> get films => _films;

  Future<void> onStart() async {
    setState(ViewState.Busy);

    var films = await _service.getListFilms();

    if(films.hasError()) return null;

    _verifyListFilms(films);

    setState(ViewState.Idle);
  }

  void _verifyListFilms(ListFilmsResponse response) {
    if (response.films != null) {

      var listmodel = ListFilmsModel(
        count: response.count,
        films: response.films.map((i) => FilmModel.fromFilmResponse(i)).toList()
      );

      listmodel.films.sort((a,b) => a.episodeId.compareTo(b.episodeId));

      setFilms(listmodel.films);
    }

  }

  void setFilms(List<FilmModel> films) {
    _films = films;
    notifyListeners();
  }

}