import 'package:bloc_learning/cubit/counter_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(CounterState(
          counterValue: 0,
          wasIncremented: true,
        ));

  void increment() => emit(CounterState(
        counterValue: state.counterValue + 1,
        wasIncremented: true,
      ));

  void decrement() => emit(CounterState(
        counterValue: state.counterValue - 1,
        wasIncremented: false,
      ));
}
