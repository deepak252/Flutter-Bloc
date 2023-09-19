import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment()=>emit(state+1);
  void decrement()=>emit(state-1);

  @override
  Future<void> close() {
    log("CounterCubit Closed");
    return super.close();
  }
}