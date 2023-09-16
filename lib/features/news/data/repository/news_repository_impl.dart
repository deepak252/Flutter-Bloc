
import 'package:bloc_app/core/resources/exceptions.dart';
import 'package:bloc_app/core/resources/failure.dart';
import 'package:bloc_app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:bloc_app/features/news/domain/entities/news_category.dart';
import 'package:bloc_app/features/news/domain/entities/article.dart';
import 'package:bloc_app/core/resources/result.dart';
import 'package:bloc_app/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  final NewsRemoteDataSource _remoteDataSource;

  NewsRepositoryImpl({
    required NewsRemoteDataSource remoteDataSource
  }): _remoteDataSource = remoteDataSource;
  
  @override
  Future<Result<List<Article>>> getArticles(String categoryId)async{
    try{
      final articles = await _remoteDataSource.getArticles(categoryId);
      return ResultSuccess(articles);
    }on ServerException catch(e){
      return ResultFailure(
        ServerFailure(message: '${e.message}')
      );
    }catch(e){
      return const ResultFailure(
        ServerFailure(message: 'Something went wrong')
      );
    }
  }

  @override
  Future<Result<List<NewsCategory>>> getCategories()async{
    try{
      final articles = await _remoteDataSource.getCategories();
      return ResultSuccess(articles);
    }on ServerException catch(e){
      return ResultFailure(
        ServerFailure(message: '${e.message}')
      );
    }catch(e){
      return const ResultFailure(
        ServerFailure(message: 'Something went wrong')
      );
    }
  }
  
}