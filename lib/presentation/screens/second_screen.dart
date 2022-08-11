// ignore_for_file: deprecated_member_use

import 'package:bloc_learning/bloc/cubit/counter_cubit.dart';
import 'package:bloc_learning/bloc/cubit/counter_state.dart';
import 'package:bloc_learning/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final Color color;
  // final GlobalKey<ScaffoldState> homeScreenKey;
  const SecondScreen({
    Key? key,
    required this.title,
    required this.color,
    // required this.homeScreenKey,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  GlobalKey<ScaffoldState> secondScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: secondScreenKey,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  // widget.homeScreenKey.currentState?.removeCurrentSnackBar();
                  secondScreenKey.currentState?.showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  // widget.homeScreenKey.currentState?.removeCurrentSnackBar();
                  secondScreenKey.currentState?.removeCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text(widget.title),
                  backgroundColor: widget.color,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  backgroundColor: widget.color,
                  heroTag: Text('${widget.title} 2nd'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),
            MaterialButton(
              color: Colors.purple,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Explore 3rd Screen ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      // value: CounterCubit(),
                      value: BlocProvider.of<CounterCubit>(context),
                      child: const ThirdScreen(
                        title: 'Third Screen',
                        color: Colors.purple,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
