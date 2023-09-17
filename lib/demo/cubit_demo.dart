
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit():super(0);

  void increment()=> emit(state+1);
  void decrement()=> emit(state-1);
}

void main(List<String> args)async{
  // log("START");
  final cubit = CounterCubit();
  // log("END");
  print(cubit.state);
  cubit.increment();
  print(cubit.state);

}