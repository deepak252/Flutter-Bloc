
import 'dart:convert';

import 'package:bloc_app/core/constants/api_path.dart';
import 'package:bloc_app/core/resources/exceptions.dart';
import 'package:bloc_app/features/news/data/models/models.dart';
import 'package:http/http.dart' as http;

abstract class NewsRemoteDataSource{
  Future<List<ArticleModel>> getArticles(String categoryId);
  Future<List<NewsCategoryModel>> getCategories();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource{
  final http.Client httpClient;

  NewsRemoteDataSourceImpl({required this.httpClient});
  
  @override
  Future<List<ArticleModel>> getArticles(String categoryId)async{
    final response = await http.get(Uri.parse('${ApiPath.articlesUrl}/$categoryId'));
    if(response.statusCode==200){
      final articlesJson = json.decode(response.body)?['data'];
      return articlesFromJson(articlesJson);
    }else{
      throw ServerException(message: "Server Error");
    }
  }

  @override
  Future<List<NewsCategoryModel>> getCategories()async{
    final response = await http.get(Uri.parse(ApiPath.categoriesUrl));
    if(response.statusCode==200){
      final categoriesJson = json.decode(response.body)?['data']?['news_category'];
      return categoriesFromJson(categoriesJson);
    }else{
      throw ServerException(message: "Server Error");
    }
  }

}