import 'package:bloc_learning/bloc/cubit/counter_cubit.dart';
import 'package:bloc_learning/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'blocSM-learning',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
