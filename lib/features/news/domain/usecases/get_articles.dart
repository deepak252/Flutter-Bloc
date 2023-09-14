
import 'package:bloc_app/core/resources/api_response.dart';
import 'package:bloc_app/core/usecases/usecase.dart';
import 'package:bloc_app/features/news/domain/entities/entities.dart';
import 'package:bloc_app/features/news/domain/repository/news_repository.dart';
import 'package:equatable/equatable.dart';

class GetArticles extends UseCase<ApiResponse<List<Article>>, ArticleParams>{
  final NewsRepository _newsRepository;
  GetArticles(NewsRepository newsRepository) : _newsRepository = newsRepository;

  @override
  Future<ApiResponse<List<Article>>> call(ArticleParams params)async{
    return await _newsRepository.getArticles(params.categoryId);
  }
}

class ArticleParams extends Equatable{
  final String categoryId;
  const ArticleParams({required this.categoryId});

  @override
  List<Object> get props=>[categoryId];
}