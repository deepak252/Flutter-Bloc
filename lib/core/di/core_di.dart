import 'package:bloc_app/core/util/input_converter.dart';
import 'package:bloc_app/core/util/network_info.dart';
import 'package:get_it/get_it.dart';


void coreDI(GetIt sl){
  
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));



}