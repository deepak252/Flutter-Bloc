import 'package:bloc_app/core/error/exception.dart';
import 'package:bloc_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class NumberTriviaLocalDataSource{
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource{
  final numberTriviaBox = Hive.box('numberTriviaBox');

  @override
  Future<NumberTriviaModel> getLastNumberTrivia()async{
    final numberTriviaJson = numberTriviaBox.get(0);
    if(numberTriviaJson!=null){
      return Future.value(NumberTriviaModel.fromJson(numberTriviaJson));
    }else{
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache)async{
    await numberTriviaBox.add(triviaToCache.toJson());
  }

}