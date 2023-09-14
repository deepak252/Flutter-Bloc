
import 'package:equatable/equatable.dart';

class NewsCategory extends Equatable{
  final String id;
  final String name;

  const NewsCategory({required this.id, required this.name});

  // props : list of fields, for object comparision
  @override
  List<Object> get props=> [id,name];

}
