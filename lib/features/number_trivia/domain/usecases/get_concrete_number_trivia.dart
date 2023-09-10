
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/usecases/usecase.dart';
import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia,ConcreteNumberTriviaParams>{
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>>  call(ConcreteNumberTriviaParams params)async{
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class ConcreteNumberTriviaParams{
  final int number;
  const ConcreteNumberTriviaParams({required this.number});
}
