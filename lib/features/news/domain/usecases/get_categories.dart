
import 'package:bloc_app/core/resources/api_response.dart';
import 'package:bloc_app/core/usecases/usecase.dart';
import 'package:bloc_app/features/news/domain/entities/entities.dart';
import 'package:bloc_app/features/news/domain/repository/news_repository.dart';

class GetCategories extends UseCase<ApiResponse<List<NewsCategory>>, void>{
  final NewsRepository _newsRepository;
  GetCategories(NewsRepository newsRepository) : _newsRepository = newsRepository;

  @override
  Future<ApiResponse<List<NewsCategory>>> call(void params)async{
    return await _newsRepository.getCategories();
  }
}
