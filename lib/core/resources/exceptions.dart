class AppException implements Exception{
  final String? message;
  const AppException({this.message});
}

class ServerException extends AppException{
  ServerException({String? message}): super(message: message);
}

class CacheException extends AppException{
  CacheException({String? message}): super(message: message);
}
