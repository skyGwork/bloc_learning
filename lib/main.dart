import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_learning/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'blocSM-learning',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'BlocSM'),
      ),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const Text(
              'COUNTER VALUE',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // BlocConsumer<CounterCubit, CounterState>(
            //   listener: (context, state) {
            //     if (state.wasIncremented == true) {
            //       Scaffold.of(context).showSnackBar(
            //         SnackBar(
            //           content: Text('Incremented!'),
            //           duration: Duration(milliseconds: 300),
            //         ),
            //       );
            //     } else if (state.wasIncremented == false) {
            //       Scaffold.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Decremented!'),
            //           duration: Duration(milliseconds: 300),
            //         ),
            //       );
            //     }
            //   },
            //   builder: (context, state) {
            //     if (state.counterValue < 0) {
            //       return Text(
            //         'BRR, NEGATIVE ' + state.counterValue.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else if (state.counterValue % 2 == 0) {
            //       return Text(
            //         'YAAAY ' + state.counterValue.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else if (state.counterValue == 5) {
            //       return Text(
            //         'HMM, NUMBER 5',
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //     } else
            //       return Text(
            //         state.counterValue.toString(),
            //         style: Theme.of(context).textTheme.headline4,
            //       );
            //   },
            // ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} #2'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
