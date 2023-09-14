import 'package:equatable/equatable.dart';

class Article extends Equatable{
  final String id;
  final String title;
  final String details;
  final String imageUrl;

  const Article({
    required this.id,
    required this.title, 
    required this.details, 
    required this.imageUrl
  });
  // props : list of fields, for object comparision
  @override
  List<Object> get props=>[id, title, details, imageUrl];
  
}