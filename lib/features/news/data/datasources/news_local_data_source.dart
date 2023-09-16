import 'package:bloc_app/core/resources/exceptions.dart';
import 'package:bloc_app/core/util/db.dart';
import 'package:bloc_app/features/news/data/models/models.dart';

abstract class NewsLocalDataSource{
  Future<List<ArticleModel>> getArticlesFromCache();
  Future<List<NewsCategoryModel>> getCategoriesFromCache();
  Future<void> cacheArticles(List<ArticleModel> articles);
  Future<void> cacheCategories(List<NewsCategoryModel> categories);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource{
  final newsBox = NewsBox.instance;

  @override
  Future<List<ArticleModel>> getArticlesFromCache()async{
    final articlesJson = await newsBox.get(NewsBox.articlesKey);
    if(articlesJson!=null){
      return articlesFromJson(articlesJson);
    }else{
      throw CacheException(message: 'Articles Cache is Empty');
    }
  }

  @override
  Future<List<NewsCategoryModel>> getCategoriesFromCache()async{
    final categoriesJson = await newsBox.get(NewsBox.categoriesKey);
    if(categoriesJson!=null){
      return categoriesJson(categoriesJson);
    }else{
      throw CacheException(message: 'Categories Cache is Empty');
    }
  }

  @override
  Future<void> cacheArticles(List<ArticleModel> articles)async{
    await newsBox.put(NewsBox.articlesKey, articlesToJson(articles));
  }

  @override
  Future<void> cacheCategories(List<NewsCategoryModel> categories)async{
    await newsBox.put(NewsBox.categoriesKey, categoriesToJson(categories));
  }

}