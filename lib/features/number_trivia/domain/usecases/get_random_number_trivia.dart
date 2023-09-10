
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/usecases/usecase.dart';
import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, RandomNumberTriviaParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(RandomNumberTriviaParams params)async{
    return  await repository.getRandomNumberTrivia();
  }
}

class RandomNumberTriviaParams{}