

import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState >{


  NumberTriviaBloc():super(NumberTriviaLoading());


}