import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:starwars/modules/detail_film/detail_film_view.dart';
import 'package:starwars/modules/home/model/film_model.dart';
import 'package:starwars/modules/splash/splash_view.dart';
import 'package:starwars/ui/shared/app_colors.dart';
import 'package:starwars/modules/home/home_view.dart';
import 'transitions/slide_route.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'splash':
        return MaterialPageRoute(builder: (_) => SplashView());
      case 'detail_film':
        var arguments = settings.arguments as FilmModel;
        return SlideRightRoute(page: DetailFilmView(film: arguments));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: Text("Rota não definida"),
                    backgroundColor: blueInformativeText,
                  ),
                  body: Center(
                    child: Text('A rota ${settings.name} ainda não foi criada'),
                  ),
                ));
    }
  }
}
