
import 'package:bloc_app/features/news/domain/entities/entities.dart';

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
    }catch(e){
      throw FormatException("Error parsing JSON to Article: $e");
    }
  }

  Map<String, dynamic> toJson()=>{
    '_id': id,
    'title': title,
    'details': details,
    'image_url': imageUrl
  };
}