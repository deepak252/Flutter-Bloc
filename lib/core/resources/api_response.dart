
import 'dart:io';

abstract class ApiResponse<T>{
  final T? data;
  final HttpException? error;

  const ApiResponse({this.data, this.error});
}

class ApiResponseSuccess<T> extends ApiResponse<T>{
  const ApiResponseSuccess(T data) : super(data: data);
}


class ApiResponseFailure<T> extends ApiResponse<T>{
  const ApiResponseFailure(HttpException error) : super(error: error);
}