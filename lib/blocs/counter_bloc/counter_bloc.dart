
import 'package:bloc_app/blocs/counter_bloc/counter_event.dart';
import 'package:bloc_app/blocs/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  
  CounterBloc():super(CounterInitialState()){
    on<CounterIncrementEvent>((event, emit) => emit(CounterIncrementState(state.count+1)));
    on<CounterDecrementEvent>((event, emit) => emit(CounterDecrementState(state.count-1)));
  }
  
}