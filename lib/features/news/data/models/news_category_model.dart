import 'dart:developer';
import 'package:bloc_app/features/news/domain/entities/entities.dart';

List<NewsCategoryModel> categoriesFromJson(List<Map<String,dynamic>> categoriesJson){
  return categoriesJson
    .map<NewsCategoryModel>((categoryJson)=>NewsCategoryModel.fromJson(categoryJson))
    .where((NewsCategoryModel category)=>category.id.isNotEmpty) //Filter Invalid NewsCategory Format
    .toList();
}
List<Map<String,dynamic>> categoriesToJson(List<NewsCategoryModel> categories){
  return categories
    .map<Map<String,dynamic>>((category) => category.toJson())
    .toList();
}
class NewsCategoryModel extends NewsCategory{
  const NewsCategoryModel({
    required String id,
    required String name
  }): super(id: id, name: name);

  factory NewsCategoryModel.fromJson(json){
    try{
      return NewsCategoryModel(
        id: json['category_id'], 
        name: json['category_name']
      );
    }catch(e,s){
      log("Error parsing JSON to NewsCategory: ",error: e,stackTrace: s);
      return const NewsCategoryModel(
        id: '', 
        name: ''
      );
    }
  }

  Map<String, dynamic> toJson()=>{
    'category_id': id,
    'category_name': name
  };

}