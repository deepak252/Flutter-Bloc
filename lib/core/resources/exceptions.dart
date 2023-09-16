class AppException implements Exception{
  final String? message;
  final StackTrace? stackTrace;
  const AppException({this.message, this.stackTrace});
}

class ServerException extends AppException{
  ServerException({String? message, StackTrace? stackTrace,}): super(
    message: message,
    stackTrace: stackTrace
  );
}

class CacheException extends AppException{
  CacheException({String? message, StackTrace? stackTrace,}): super(
    message: message,
    stackTrace: stackTrace
  );
}
