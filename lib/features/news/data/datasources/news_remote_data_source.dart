
import 'dart:convert';

import 'package:bloc_app/core/resources/exceptions.dart';
import 'package:bloc_app/features/news/data/models/models.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://openapi.programming-hero.com/api';
const articlesUrl = '$baseUrl/news/category/01';
const categoriesUrl = '$baseUrl/news/categories';

abstract class NewsRemoteDataSource{
  Future<List<ArticleModel>> getArticles(String categoryId);
  Future<List<NewsCategoryModel>> getCategories();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource{
  final http.Client httpClient;

  NewsRemoteDataSourceImpl({required this.httpClient});
  
  @override
  Future<List<ArticleModel>> getArticles(String categoryId)async{
    final response = await http.get(Uri.parse(articlesUrl));
    if(response.statusCode==200){
      List articlesData = json.decode(response.body)?['data'];
      return articlesData.map((articleJson) => 
        ArticleModel.fromJson(articleJson)
      ).toList();
    }else{
      throw ServerException(message: "Server Error");
    }
  }

  @override
  Future<List<NewsCategoryModel>> getCategories()async{
    final response = await http.get(Uri.parse(categoriesUrl));
    if(response.statusCode==200){
      List categoriesData = json.decode(response.body)?['data']?['news_category'];
      return categoriesData.map((categoryJson) => 
        NewsCategoryModel.fromJson(categoryJson)
      ).toList();
    }else{
      throw ServerException(message: "Server Error");
    }
  }

}