import 'package:bloc_learning/bloc/cubit/counter_cubit.dart';
import 'package:bloc_learning/presentation/screens/home_screen.dart';
import 'package:bloc_learning/presentation/screens/second_screen.dart';
import 'package:bloc_learning/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blocSM-learning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': ((context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(
                title: 'HomeScreen',
                color: Colors.green,
              ),
            )),
        '/second': ((context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                title: 'SecondScreen',
                color: Colors.redAccent,
              ),
            )),
        '/third': ((context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                title: 'Third Screen',
                color: Colors.purple,
              ),
            )),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
