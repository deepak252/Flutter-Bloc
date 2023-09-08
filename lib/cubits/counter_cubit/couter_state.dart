abstract class CounterState{
  int count;
  CounterState({required this.count});
}

class CounterInitialState extends CounterState{
  CounterInitialState(int initCount) : super(count: initCount);
}

class CounterIncrementState extends CounterState{
  CounterIncrementState(int incrCount) : super(count: incrCount);
}

class CounterDecrementState extends CounterState{
  CounterDecrementState(int decrCount) : super(count: decrCount);
}
