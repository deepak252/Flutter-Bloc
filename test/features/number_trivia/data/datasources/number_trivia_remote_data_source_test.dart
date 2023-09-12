import 'package:bloc_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  NumberTriviaRemoteDataSourceImpl? dataSource;
  MockHttpClient? mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NumberTriviaRemoteDataSourceImpl(client: mockHttpClient!);
  });

  group('getConcreteNumberTrivia', (){
    const tNumber = 1;
    test(
      'should perform a GET request with application/json', 
      ()async{
        //arrange
        when(mockHttpClient?.get(Uri.parse('any'), headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(fixture('trivia.json'),200));

        dataSource?.getConcreteNumberTrivia(tNumber);
        verify(mockHttpClient?.get(
          Uri.parse('http://numbersapi.com/$tNumber'),
          headers: {
            'Content-Type': 'application/json'
          }
        ));
      }
    );
  });
}
