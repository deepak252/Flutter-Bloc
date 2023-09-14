import 'package:bloc_app/core/resources/api_response.dart';
import 'package:bloc_app/features/news/domain/entities/entities.dart';

abstract class NewsRepository{
  Future<ApiResponse<List<Article>>> getArticles(String categoryId);
  Future<ApiResponse<List<NewsCategory>>> getCategories();
}