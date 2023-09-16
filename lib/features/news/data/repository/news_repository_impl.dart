import 'package:bloc_app/core/resources/exceptions.dart';
import 'package:bloc_app/core/resources/failure.dart';
import 'package:bloc_app/features/news/data/datasources/news_local_data_source.dart';
import 'package:bloc_app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:bloc_app/features/news/domain/entities/news_category.dart';
import 'package:bloc_app/features/news/domain/entities/article.dart';
import 'package:bloc_app/core/resources/result.dart';
import 'package:bloc_app/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository{
  final NewsRemoteDataSource _remoteDataSource;
  final NewsLocalDataSource _localDataSource;

  NewsRepositoryImpl({
    required NewsRemoteDataSource remoteDataSource,
    required NewsLocalDataSource localDataSource
  }): _remoteDataSource = remoteDataSource,
    _localDataSource = localDataSource;
  
  @override
  Future<Result<List<Article>>> getArticles(String categoryId)async{
    try{
      final articles = await _remoteDataSource.getArticles(categoryId);
      await _localDataSource.cacheArticles(articles);
      return ResultSuccess(data: articles);
    } on CacheException catch(e){
      return ResultFailure(
        failure: CacheFailure(message: e.message)
      );
    } catch(e){
      final cachedArticles = await _localDataSource.getArticlesFromCache();
      final failure = ServerFailure(
        message: e is ServerException ?  '${e.message}' : 'Something went wrong!'
      );
      return ResultFailure(failure: failure, data: cachedArticles);
    }
  }

  @override
  Future<Result<List<NewsCategory>>> getCategories()async{
    try{
      final categories = await _remoteDataSource.getCategories();
      await _localDataSource.cacheCategories(categories);
      return ResultSuccess(data: categories);
    } on CacheException catch(e){
      return ResultFailure(
        failure: CacheFailure(message: e.message)
      );
    } catch(e){
      final cachedCategories = await _localDataSource.getCategoriesFromCache();
      final failure = ServerFailure(
        message: e is ServerException ?  '${e.message}' : 'Something went wrong!'
      );
      return ResultFailure(failure: failure, data: cachedCategories);
    }
  }
  
}