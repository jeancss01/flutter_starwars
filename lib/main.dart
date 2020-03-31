import 'package:flutter/material.dart';
import 'package:starwars/app.dart';
import 'package:starwars/locator.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    runApp(MyApp(authenticated: false));
  } catch (error) {
    print("Exception occured: $error stackTrace: ${error.toString()}");
    print('Locator setup has failed');
  }
}


