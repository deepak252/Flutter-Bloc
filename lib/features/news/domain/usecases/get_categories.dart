
import 'package:bloc_app/core/resources/result.dart';
import 'package:bloc_app/core/usecases/usecase.dart';
import 'package:bloc_app/features/news/domain/entities/entities.dart';
import 'package:bloc_app/features/news/domain/repository/news_repository.dart';

class GetCategories extends UseCase<Result<List<NewsCategory>>, void>{
  final NewsRepository _newsRepository;
  GetCategories(NewsRepository newsRepository) : _newsRepository = newsRepository;

  @override
  Future<Result<List<NewsCategory>>> call(void params)async{
    return await _newsRepository.getCategories();
  }
}
