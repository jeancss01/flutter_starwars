

import 'package:flutter/material.dart';
import 'package:starwars/modules/home/model/film_model.dart';

class DetailFilmView extends StatefulWidget {
  final FilmModel film;

  DetailFilmView({this.film});

  @override
  _DetailFilmView createState() => _DetailFilmView();

}

class _DetailFilmView extends State<DetailFilmView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5, 25, 5, 20),
                child: Text(
                    this.widget.film.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        _prepareUrlImage(this.widget.film.imgFilm),
                        fit: BoxFit.contain,
                        width: 171,
                        height: 224,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "Release",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    )),
                                Text(
                                    _splitStringDate(this.widget.film.releaseDate),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(.6),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "Director",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    )),
                                Text(
                                    this.widget.film.director,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(.6),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "Producter(s)",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    )),
                                  Text(
                                      this.widget.film.producer.replaceAll(", ", ",\n"),
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(.6),
                                      )
                                  )

                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    "Episode",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    )),
                                Text(
                                    this.widget.film.episodeId.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(.6),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text(
                    this.widget.film.openingCrawl,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                    )
                ),
              )
            ],
          ),
        )
      )
    );
  }

  String _prepareUrlImage(String url) {
    return "https://starwars-visualguide.com/assets/img/"+ _splitString(url) +".jpg";
  }

  String _splitString(String s) {
    var separated = s.split("/");
    return separated[separated.length - 3]+"/"+separated[separated.length- 2];
  }

  String _splitStringDate(String s) {
    var separated = s.split("-");

    return separated[2]+"/"+separated[1]+"/"+separated[0];
  }

}