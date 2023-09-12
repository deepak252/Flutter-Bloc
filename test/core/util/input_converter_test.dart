
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  InputConverter? inputConverter;

  setUp((){
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', (){
    test(
      'should return an integer when string represents an unsigned integer',
       (){
        //arrange
        const str = '12';
        //act
        final result = inputConverter!.stringToUnsignedInteger(str);
        //assert
        expect(result, const Right(12));
       }
      );

    test(
      'should return failure when string represents is not an integer',
       (){
        //arrange
        const str = 'abc';
        //act
        final result = inputConverter!.stringToUnsignedInteger(str);
        //assert
        expect(result, Left(InvalidInputFailure()));
       }
      );
    
    test(
      'should return failure when string represents is a negative integer',
       (){
        //arrange
        const str = '-10';
        //act
        final result = inputConverter!.stringToUnsignedInteger(str);
        //assert
        expect(result, Left(InvalidInputFailure()));
       }
      );
  });
}