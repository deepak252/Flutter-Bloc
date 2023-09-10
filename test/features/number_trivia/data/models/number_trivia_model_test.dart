
import 'dart:convert';
import 'dart:math';

import 'package:bloc_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main(){
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test(
    'should be a class of NumberTrivia entity', 
    (){
      expect(tNumberTriviaModel, isA<NumberTrivia>());
    });

  group('fromJson', (){
    test(
      'Should return a valid model when the JSON number is an integer', 
      ()async{
        final Map<String,dynamic> jsonMap = json.decode(fixture('trivia.json'));
        final result = NumberTriviaModel.fromJson(jsonMap);
        expect(result, tNumberTriviaModel);
      });

    test(
      'Should return a valid model when the JSON number is double', 
      ()async{
        final Map<String,dynamic> jsonMap = json.decode(fixture('trivia_double.json'));
        final result = NumberTriviaModel.fromJson(jsonMap);
        expect(result, tNumberTriviaModel);
      });
    
  });

  group('toJson', (){
    test(
      'Should return a JSON map containing the proper data', 
      ()async{
        final result = tNumberTriviaModel.toJson();
        final expectedMap = {
          "text": "Test Text",
          "number": 1
        };
        expect(result, expectedMap);

      });

    
    
  });
}