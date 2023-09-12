
import 'package:bloc_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class InputConverter{
  Either<Failure,int> stringToUnsignedInteger(String str){
    try{
      final integer = int.parse(str);
      if(integer<0){
        throw const FormatException();
      }
      return Right(integer);
    }on Exception{
      return Left(InvalidInputFailure());
    }
  }
}

