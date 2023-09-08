

import 'package:bloc_app/cubits/counter_cubit/couter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit(): super(CounterInitialState(0));

  void increment() => emit(CounterIncrementState(state.count+1));
  void decrement() => emit(CounterIncrementState(state.count-1));


}