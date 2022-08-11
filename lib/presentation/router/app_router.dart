import 'package:bloc_learning/presentation/screens/home_screen.dart';
import 'package:bloc_learning/presentation/screens/page404.dart';
import 'package:bloc_learning/presentation/screens/second_screen.dart';
import 'package:bloc_learning/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                  title: 'HomeScreen',
                  color: Colors.green,
                ));
        // ignore: dead_code
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                  title: 'SecondScreen',
                  color: Colors.redAccent,
                ));
        // ignore: dead_code
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                  title: 'Third Screen',
                  color: Colors.purple,
                ));
        // ignore: dead_code
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => const PageNotFound(),
        );
    }
  }
}
