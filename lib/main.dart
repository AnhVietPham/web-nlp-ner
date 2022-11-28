import 'package:flutter/material.dart';
import 'injection_container.dart' as DI;
import 'views/animated_splash_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DI.init();
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
