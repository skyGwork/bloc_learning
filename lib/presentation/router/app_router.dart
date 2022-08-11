
import 'package:bloc_learning/bloc/cubit/counter_cubit.dart';
import 'package:bloc_learning/presentation/screens/home_screen.dart';
import 'package:bloc_learning/presentation/screens/page404.dart';
import 'package:bloc_learning/presentation/screens/second_screen.dart';
import 'package:bloc_learning/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(
                    title: 'HomeScreen',
                    color: Colors.green,
                  ),
                ));
        // ignore: dead_code
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                    title: 'SecondScreen',
                    color: Colors.redAccent,
                  ),
                ));
        // ignore: dead_code
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdScreen(
                    title: 'Third Screen',
                    color: Colors.purple,
                  ),
                ));
        // ignore: dead_code
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const PageNotFound(),
          ),
        );
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
