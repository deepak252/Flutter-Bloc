

import 'package:bloc_app/core/util/input_converter.dart';
import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:bloc_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetConcreteNumberTrivia extends Mock implements GetConcreteNumberTrivia{}

class MockGetRandomNumberTrivia extends Mock implements GetRandomNumberTrivia{}

class MockInputConverter extends Mock implements InputConverter{}

void main() {
  NumberTriviaBloc? bloc;
  MockGetConcreteNumberTrivia? mockGetConcreteNumberTrivia;
  MockGetRandomNumberTrivia? mockGetRandomNumberTrivia;
  MockInputConverter? mockInputConverter;


  setUp((){
    mockGetConcreteNumberTrivia = MockGetConcreteNumberTrivia();
    mockGetRandomNumberTrivia = MockGetRandomNumberTrivia();
    mockInputConverter = MockInputConverter();
    bloc = NumberTriviaBloc(
      getConcreteNumberTrivia: mockGetConcreteNumberTrivia!, 
      getRandomNumberTrivia: mockGetRandomNumberTrivia!, 
      inputConverter: mockInputConverter!
    );
  });

  test(
    'initial state should be empty', 
    (){
      expect(bloc!.state, equals(NumberTriviaEmpty()));
    });

  group('fetchConcreteNumberTrivia', (){
    const tNumberString = '1';
    const tNumberParsed = 1;
    const tNumberTrivia = NumberTrivia(number: 1, text: 'Test Trivia');

    test(
      'should call the InputConverter to validate and convert the string to an unsigned integer', 
      ()async{
        // arrange
        when(mockInputConverter!.stringToUnsignedInteger(any??'')).thenReturn(const Right(tNumberParsed));
        //act
        bloc!.add(const FetchConcreteNumberTrivia(tNumberString));
        await untilCalled(mockInputConverter!.stringToUnsignedInteger(tNumberString));
        //assert
        verify(mockInputConverter!.stringToUnsignedInteger(tNumberString));
      });

    test(
      'should emit [Error] when the input is invalid', 
      ()async{
        // arrange
        when(mockInputConverter!.stringToUnsignedInteger(any??'')).thenReturn(const Right(tNumberParsed));
        //assert
        final expected = [
            NumberTriviaEmpty(),
            const NumberTriviaError(message: invalidInputFailureMessage)
        ];
        expectLater(
          bloc!.state, 
          expected
        );
        //act
        bloc!.add(const FetchConcreteNumberTrivia(tNumberString));
        
      });

    test(
      'should get data from the concrete usecase', 
      ()async{
        // arrange
        when(mockInputConverter!.stringToUnsignedInteger(any??'')).thenReturn(const Right(tNumberParsed));
        
      });
  });
}