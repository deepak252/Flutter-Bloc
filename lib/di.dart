
import 'package:bloc_app/core/di/core_di.dart';
import 'package:bloc_app/features/number_trivia/di/number_trivia_di.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

//Service Locator - Dependency Injection
final sl = GetIt.instance;
void init(){

  //Features
  numberTriviaDI(sl);
  //Core
  coreDI(sl);

  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  
}