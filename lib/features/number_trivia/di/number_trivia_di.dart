import 'package:bloc_app/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:bloc_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:bloc_app/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:bloc_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:bloc_app/features/number_trivia/domain/usecases/use_cases.dart';
import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:get_it/get_it.dart';

// Number Trivia Feature 
void numberTriviaDI(GetIt sl){
  sl.registerFactory(() => NumberTriviaBloc(
    getConcreteNumberTrivia: sl(), 
    getRandomNumberTrivia: sl(), 
    inputConverter: sl()
  ));

  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  sl.registerLazySingleton<NumberTriviaRepository>(() => 
    NumberTriviaRepositoryImpl(
      remoteDataSource: sl(), 
      localDataSource: sl(), 
      networkInfo: sl()
    )
  );

  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(() => 
    NumberTriviaRemoteDataSourceImpl(client: sl())
  );
  sl.registerLazySingleton<NumberTriviaLocalDataSource>(() => 
    NumberTriviaLocalDataSourceImpl()
  );
}