
import 'package:bloc_app/core/utils/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker{

}

void main(){
  NetworkInfoImpl? networkInfoImpl;
  MockInternetConnectionChecker? mockInternetConnectionChecker;

  setUp((){
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(mockInternetConnectionChecker!);
  });

  group('isConnected', (){
    test(
      'should forward the call to DataConnectionChecker.hasConnection', 
      ()async{
        //arrange
        when(mockInternetConnectionChecker?.hasConnection).thenAnswer((_)async => true);
        //act
        final result = await networkInfoImpl?.isConnected;
        //assert
        verify(mockInternetConnectionChecker?.hasConnection);
        expect(result, true);
      }
    );
  });
}