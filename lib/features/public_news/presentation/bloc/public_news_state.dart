// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'public_news_bloc.dart';

abstract class PublicNewsState extends Equatable {
  List<PublicNewsModel> newsList;
  PublicNewsState({this.newsList = const[]});

  @override
  List<Object> get props => [];
}

class Initial extends PublicNewsState {}

class Loading extends PublicNewsState {
  
  Loading({List<PublicNewsModel> newsList = const[]}):super(newsList: newsList);
}

class Loaded extends PublicNewsState {
  
  Loaded({List<PublicNewsModel> newsList = const[]}):super(newsList: newsList);
}

class Error extends PublicNewsState {
  final String? errorMessage;

   Error(this.errorMessage);
}
