import 'package:bloc_app/core/resources/result.dart';
import 'package:bloc_app/features/news/domain/entities/entities.dart';

abstract class NewsRepository{
  Future<Result<List<Article>>> getArticles(String categoryId);
  Future<Result<List<NewsCategory>>> getCategories();
}