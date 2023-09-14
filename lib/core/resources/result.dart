import 'package:bloc_app/core/resources/failure.dart';

abstract class Result<T>{
  final T? data;
  final Failure? failure;

  const Result({this.data, this.failure});
}

class ResultSuccess<T> extends Result<T>{
  const ResultSuccess(T data) : super(data: data);
}

class ResultFailure<T> extends Result<T>{
  const ResultFailure(Failure failure) : super(failure: failure);
}