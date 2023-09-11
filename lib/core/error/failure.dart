import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List _properties;
  const Failure([List properties = const<dynamic>[]]) : _properties = properties ;


  @override
  List<Object?> get props => _properties;

}

class ServerFailure extends Failure{

}
class CacheFailure extends Failure{

}