import 'package:flutter/material.dart';
import 'package:starwars/core/enums/viewstate.dart';
import 'package:starwars/modules/home/model/film_model.dart';


class ListViewFilms extends StatelessWidget {

  final List<FilmModel> films;
  final ViewState state;

  ListViewFilms({
    this.films,
    this.state
});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Visibility(
          visible: state == ViewState.Idle ? true : false,
          child: Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: films.length,
                itemBuilder: (context, indice) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detail_film', arguments: films[indice]),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)
                        ),
                        elevation: 3,
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.all(4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(child:
                                Image.network(
                                  prepareUrlImage(films[indice].imgFilm),
                                  fit: BoxFit.contain,
                                  height: 140,
                                  width: 104,
                                )
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      films[indice].title,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      "Episode: ${films[indice].episodeId.toString()}",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.7),
                                          fontSize: 16
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.movie,
                                                  color: Colors.black.withOpacity(.6),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              child: Text(
                                                "Director",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black.withOpacity(.6),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              child: Text(
                                                films[indice].director,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black.withOpacity(.6),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: <Widget>[
                                              Icon(
                                                Icons.event_note,
                                                color: Colors.black.withOpacity(.6),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Release year:",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black.withOpacity(.6),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              child: Text(
                                                spliStringDateYear(films[indice].releaseDate),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black.withOpacity(.6),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],),
                        )
                    ),
                  );
                }),
          ),
        ),
        Visibility(
          visible: state == ViewState.Busy ? true : false,
          child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )
          ),
        )
      ],
    );
  }

  String prepareUrlImage(String url) {
    return "https://starwars-visualguide.com/assets/img/"+ _splitString(url) +".jpg";
  }

  String _splitString(String s) {
    var separated = s.split("/");
    return separated[separated.length - 3]+"/"+separated[separated.length- 2];
  }

  String spliStringDateYear(String s) {

    var separated = s.split("-");
    return separated[0];
  }

}