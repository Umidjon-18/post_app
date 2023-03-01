// ignore_for_file: must_be_immutable

part of 'saved_news_bloc.dart';

abstract class SavedNewsState extends Equatable {
  List<PublicNewsModel> newsList;
  SavedNewsState({this.newsList = const []});

  @override
  List<Object> get props => [];
}

class Initial extends SavedNewsState {}

class Loading extends SavedNewsState {
  Loading({List<PublicNewsModel> newsList = const []}) : super(newsList: newsList);
}

class Loaded extends SavedNewsState {
  Loaded({List<PublicNewsModel> newsList = const []}) : super(newsList: newsList);
}

class Error extends SavedNewsState {
  String? errorMessage;
  Error({this.errorMessage});
}
