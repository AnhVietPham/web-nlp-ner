import 'package:flutter/material.dart';

import 'views/animated_splash_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnimatedSplashView(),
        routes: <String, WidgetBuilder>{
          '/HOME_SCREEN': (BuildContext context) => const HomeView(),
        });
  }
}
