

import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:equatable/equatable.dart';


abstract class NumberTriviaState extends Equatable{
  const NumberTriviaState();
  @override
  List<Object?> get props => [];
}

class NumberTriviaEmpty extends NumberTriviaState{
}

class NumberTriviaLoading extends NumberTriviaState{
}

class NumberTriviaLoaded extends NumberTriviaState{
  final NumberTrivia  trivia;

  const NumberTriviaLoaded({required this.trivia});

  @override
  List<Object?> get props => [trivia];
  
}

class NumberTriviaError extends NumberTriviaState{
  final String message;

  const NumberTriviaError({required this.message});

  @override
  List<Object?> get props => [message];

}
