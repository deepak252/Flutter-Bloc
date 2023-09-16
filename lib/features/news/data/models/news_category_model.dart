import 'package:bloc_app/features/news/domain/entities/entities.dart';

class NewsCategoryModel extends NewsCategory{
  const NewsCategoryModel({
    required String id,
    required String name
  }): super(id: id, name: name);

  factory NewsCategoryModel.fromJson(json)=> NewsCategoryModel(
    id: json['category_id'], 
    name: json['category_name']
  );

  Map<String, dynamic> toJson()=>{
    'category_id': id,
    'category_name': name
  };

}