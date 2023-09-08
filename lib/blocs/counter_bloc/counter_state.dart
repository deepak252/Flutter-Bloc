abstract class CounterState{
  int count = 0;
  CounterState({required this.count});
}

class CounterInitialState extends CounterState{
  CounterInitialState() : super(count: 0);
}

class CounterIncrementState extends CounterState{
  CounterIncrementState(int value) : super(count: value);
}

class CounterDecrementState extends CounterState{
  CounterDecrementState(int value) : super(count: value);
}
