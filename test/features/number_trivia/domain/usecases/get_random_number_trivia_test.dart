
import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:bloc_app/features/number_trivia/domain/usecases/use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository{
  
}

void main(){
  MockNumberTriviaRepository? mockNumberTriviaRepository;
  GetRandomNumberTrivia? usecase;
  setUp((){
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(text: 'test 1', number: tNumber);

  test(
    'should get trivia for the number from the repository',
    ()async{
      //arrange
      when(mockNumberTriviaRepository!.getConcreteNumberTrivia(1))
      .thenAnswer((_)async => const Right(tNumberTrivia));
      //act
      final result = await usecase!(RandomNumberTriviaParams());
      //assert
      expect(result, const Right(tNumberTrivia));
      verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    }
  );
}
