
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starwars/modules/splash/viewmodel/splash_view_model.dart';
import 'package:starwars/ui/base/base_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 5)).then((_){
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        builder: (context, viewModel, child) => Container(
          color: Colors.black,
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset('images/logo_starwars.png'),
            ),
          ),
        )
    );
  }
}
