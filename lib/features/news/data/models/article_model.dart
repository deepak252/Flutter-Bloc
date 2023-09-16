import 'dart:developer';
import 'package:bloc_app/features/news/domain/entities/entities.dart';

List<ArticleModel> articlesFromJson(List<Map<String,dynamic>> articlesJson){
  return articlesJson
    .map<ArticleModel>((articleJson)=>ArticleModel.fromJson(articleJson))
    .where((ArticleModel article)=>article.id.isNotEmpty) //Filter Invalid Article Format
    .toList();
}
List<Map<String,dynamic>> articlesToJson(List<ArticleModel> articles){
  return articles
    .map<Map<String,dynamic>>((article) => article.toJson())
    .toList();
}
class ArticleModel extends Article{
  const ArticleModel({
    required String id,
    required String title,
    required String details,
    required String imageUrl,
    
  }): super(id: id, title: title, details: details, imageUrl: imageUrl);

  factory ArticleModel.fromJson(Map<String, dynamic> json){
    try{
      return ArticleModel(
        id: json['_id'], 
        title: json['title'], 
        details: json['details'], 
        imageUrl: json['image_url']
      );
    }catch(e,s){
      log("Error parsing JSON to Article: ",error: e,stackTrace: s);
      return const ArticleModel(
        id: '', 
        title: '', 
        details: '',
        imageUrl: ''
      );
      // throw FormatException("Error parsing JSON to Article: $e");
    }
  }

  Map<String, dynamic> toJson()=>{
    '_id': id,
    'title': title,
    'details': details,
    'image_url': imageUrl
  };
}