import 'dart:async';


import 'package:starwars/core/data/remote/api_provider.dart';
import 'package:starwars/core/services/film/model/list_films.response.dart';

class FilmService extends ApiProvider {


  Future<ListFilmsResponse> getListFilms() async =>
      await executeAsync((httpClient) async { 
          try {
            var response = await httpClient.get('/films/?format=json');
            ListFilmsResponse listFilmsResponse = ListFilmsResponse.fromJson(response.data);
            return listFilmsResponse;
          } catch (error, stacktrace) {
            print("Exception occured: $error stackTrace: $stacktrace");
            var baseResponse = ListFilmsResponse.empty();
            baseResponse.withError(handleError(error));
            return baseResponse;
          }
      });

}