
import 'package:bloc_app/core/util/network_info.dart';
import 'package:bloc_app/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:bloc_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:bloc_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:bloc_app/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements NumberTriviaRemoteDataSource{

}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource{

}

class MockNetworkInfo extends Mock implements NetworkInfo{

}

void main(){
  NumberTriviaRepositoryImpl? repository;
  MockRemoteDataSource? mockRemoteDataSource;
  MockLocalDataSource? mockLocalDataSource;
  MockNetworkInfo? mockNetworkInfo;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource!,
      localDataSource: mockLocalDataSource!,
      networkInfo: mockNetworkInfo!
    );
  });

  group('getConcreteNumberTrivia', (){
    const tNumber = 1;
    const tNumberTriviaModel = NumberTriviaModel(
      number: tNumber, text: 'Test Trivia'
    );
    const NumberTrivia tNumberTrivia = tNumberTriviaModel;
    test(
      'should check if the device is online', 
      ()async{
        when(mockNetworkInfo?.isConnected).thenAnswer((_) async => true);
        repository?.getConcreteNumberTrivia(tNumber);
        verify(mockNetworkInfo?.isConnected);
      }
    );
  });
}

