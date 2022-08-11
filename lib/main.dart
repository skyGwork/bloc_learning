import 'package:bloc_learning/bloc/cubit/counter_cubit.dart';
import 'package:bloc_learning/bloc/cubit/counter_state.dart';
import 'package:bloc_learning/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blocSM-learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: const HomeScreen(
          title: 'BlocSM',
          color: Colors.green,
        ),
      ),
    );
  }
}
