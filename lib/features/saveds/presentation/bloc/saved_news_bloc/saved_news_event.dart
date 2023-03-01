// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'saved_news_bloc.dart';

abstract class SavedNewsEvent extends Equatable {
  const SavedNewsEvent();

  @override
  List<Object> get props => [];
}

class GetSavedNewsEvent extends SavedNewsEvent {
  List<PublicNewsModel> newsList;
  GetSavedNewsEvent({
    required this.newsList,
  });
}

class DeleteSavedNewsEvent extends SavedNewsEvent {
  BuildContext context;
  PublicNewsModel newsModel;
  DeleteSavedNewsEvent(this.context,{
    required this.newsModel,
  });
}

class DeleteSelectedSavedNewsEvent extends SavedNewsEvent {
  List<PublicNewsModel> selectedNews;
  DeleteSelectedSavedNewsEvent({
    required this.selectedNews,
  });
}
