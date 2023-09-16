import 'package:bloc_app/features/news/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable{
  final List<Article>? articles;
  final String? error;
  const NewsState({this.articles, this.error});
  @override
  List<Object?> get props=>[articles,error];
}

class ArticlesEmpty extends NewsState{} //Initial State

class ArticlesLoading extends NewsState{}

class ArticlesLoaded extends NewsState{
  const ArticlesLoaded(List<Article> articles): super(articles: articles);
}

class ArticlesError extends NewsState{
  const ArticlesError(String error): super(error: error);
}


// abstract class NewsState extends Equatable{
//   const NewsState();
//   @override
//   List<Object?> get props=>[];
// }

// class ArticlesLoading extends NewsState{}
// class ArticlesLoaded extends NewsState{
//   final List<Article> articles;
//   const ArticlesLoaded(this.articles);
//   @override
//   List<Object?> get props=>[articles];
// }
// class ArticlesError extends NewsState{
//   final String error;
//   const ArticlesError(this.error);
//   @override
//   List<Object?> get props=>[error];
// }
