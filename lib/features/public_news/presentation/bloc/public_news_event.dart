// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'public_news_bloc.dart';

abstract class PublicNewsEvent extends Equatable {
  const PublicNewsEvent();

  @override
  List<Object> get props => [];
}

class GetPublicNewsEvent extends PublicNewsEvent {
  List<PublicNewsModel> newsList;
  int newsCount;
  GetPublicNewsEvent({
    required this.newsCount,
    this.newsList = const [],
  });
}

class SaveSingleNewsEvent extends PublicNewsEvent {
  final PublicNewsModel newsModel;
  final BuildContext context;
  const SaveSingleNewsEvent(this.context, this.newsModel);
}

class SaveSelectedNewsEvent extends PublicNewsEvent {
  final List<PublicNewsModel> selectedNews;
  final BuildContext context;
  const SaveSelectedNewsEvent(this.context, this.selectedNews);
}
