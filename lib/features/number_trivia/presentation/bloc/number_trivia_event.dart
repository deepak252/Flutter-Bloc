part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable{
  const NumberTriviaEvent();

  @override
  List<Object?> get props => [];
}

class FetchConcreteNumberTrivia extends NumberTriviaEvent{
  final String numberString;
  const FetchConcreteNumberTrivia(this.numberString);

  @override
  List<Object?> get props => [numberString];
}

class FetchRandomNumberTrivia extends NumberTriviaEvent{
  const FetchRandomNumberTrivia();
}

