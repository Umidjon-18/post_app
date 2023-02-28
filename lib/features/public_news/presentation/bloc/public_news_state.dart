// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'public_news_bloc.dart';

abstract class PublicNewsState extends Equatable {
  const PublicNewsState();

  @override
  List<Object> get props => [];
}

class Initial extends PublicNewsState {}

class Loading extends PublicNewsState {
  List<PublicNewsModel> newsList = [];
  Loading({required this.newsList});
  @override
  List<Object> get props => [newsList];
}

class Loaded extends PublicNewsState {
  List<PublicNewsModel> newsList;
  Loaded({required this.newsList});
  @override
  List<Object> get props => [newsList];
}

class Error extends PublicNewsState {
  final String? errorMessage;

  const Error(this.errorMessage);
}
