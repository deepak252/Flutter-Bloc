import 'dart:developer';

class Logger{
  final String name;
  const Logger(this.name);

  void info(String method, Object? message){
    log("INFO : $name -> $method : $message ");
  }

  void error(String method,{Object? error, StackTrace? stackTrace}){
    log("ERROR : $name -> $method", error: error, stackTrace: stackTrace);
  }

}