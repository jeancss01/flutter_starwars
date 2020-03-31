
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starwars/ui/router/router.dart';
import 'package:starwars/ui/shared/app_colors.dart';

class MyApp extends StatelessWidget {
  final bool authenticated;

  MyApp({this.authenticated});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Starwars',
      theme: ThemeData(
        primaryColor: grayLabel,
        textSelectionColor: grayLabel,
        textSelectionHandleColor: grayLabel,
        cursorColor: grayLabel,
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: grayLabel,
        ),
        appBarTheme: AppBarTheme(
            elevation: 0.0,
            brightness: Brightness.light
        ),
      ),
      initialRoute: 'splash',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
