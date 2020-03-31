import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starwars/modules/home/viewmodel/home_view_model.dart';
import 'package:starwars/modules/home/widgets/list_view_films.dart';
import 'package:starwars/ui/base/base_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) => viewModel.onStart(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: appBarCustom(),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ListViewFilms(
              films: viewModel.films,
              state: viewModel.state
          ),
        ),
      )
    );
  }

  AppBar appBarCustom() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo_starwars.png',
            fit: BoxFit.contain,
            height: 62,
          )
        ],
      ),
    );
  }
}