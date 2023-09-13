library number_trivia_bloc;


import 'dart:developer';

import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/util/input_converter.dart';
import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_app/features/number_trivia/domain/usecases/use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'number_trivia_state.dart';
part 'number_trivia_event.dart';


const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String invalidInputFailureMessage = 'Invalid Input';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState >{

  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }):super(NumberTriviaEmpty()){
    on<FetchConcreteNumberTrivia>((event, emit)async{
      emit(NumberTriviaLoading());
      try{
        final inputResult = inputConverter.stringToUnsignedInteger(event.numberString);
        final integer = inputResult.getOrElse(() => throw const NumberTriviaError(message: invalidInputFailureMessage));
        var triviaResult = await  getConcreteNumberTrivia(ConcreteNumberTriviaParams(number: integer));
        triviaResult.fold(
          (failure)=>emit(NumberTriviaError(message: _mapFailureToMessage(failure))), 
          (trivia)=>emit(NumberTriviaLoaded(trivia: trivia))
        );
      }catch(e,s){
        log('ERROR FetchConcreteNumberTrivia',error: e,stackTrace: s);
        if(e is NumberTriviaError){
          emit(e);
        }
      }
      // final inputResult = inputConverter.stringToUnsignedInteger(event.numberString);
      // inputResult.fold(
      //   (failure) => emit(const NumberTriviaError(message: invalidInputFailureMessage)), 
      //   (integer)async {
      //     var triviaResult = await  getConcreteNumberTrivia(ConcreteNumberTriviaParams(number: integer));
      //     triviaResult.fold(
      //       (failure){
      //         return emit(NumberTriviaError(message: _mapFailureToMessage(failure)));
      //       }, 
      //       (trivia){
      //         return emit(NumberTriviaLoaded(trivia: trivia));
      //       }
      //     );
      //   }
      // );
    });
    on<FetchRandomNumberTrivia>((event, emit)async{
      emit(NumberTriviaLoading());
      var triviaResult = await  getRandomNumberTrivia(RandomNumberTriviaParams());
        triviaResult.fold(
          (failure){
            emit(NumberTriviaError(message: _mapFailureToMessage(failure)));
          }, 
          (trivia){
            emit(NumberTriviaLoaded(trivia: trivia));
          }
        );
    });
  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure : return serverFailureMessage;
      case CacheFailure : return cacheFailureMessage;
      default: return 'Something went wrong';
    }
  }

}