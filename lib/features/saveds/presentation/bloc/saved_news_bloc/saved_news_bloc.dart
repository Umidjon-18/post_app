// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';

import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:post_app/features/saveds/domain/usecases/saved_news_usecase.dart';

part 'saved_news_event.dart';
part 'saved_news_state.dart';

class SavedNewsBloc extends Bloc<SavedNewsEvent, SavedNewsState> {
  final SavedNewsUseCase savedNewsUseCase;
  SavedNewsBloc({
    required this.savedNewsUseCase,
  }) : super(Initial()) {
    on<GetSavedNewsEvent>((event, emit) async {
      emit(Loading());
      final response = await savedNewsUseCase(PublicNewsParams());
      response.fold(
        (l) => emit(Error(errorMessage: l.errorMessage)),
        (newsList) => emit(Loaded(newsList: newsList)),
      );
    });

    on<DeleteSavedNewsEvent>((event, emit) async {
      emit(Loading());
      final response = await savedNewsUseCase.deleteNews(
        PublicNewsParams(newsModel: event.newsModel),
      );
      response.fold(
        (l) => emit(Error(errorMessage: l.errorMessage)),
        (newsList) => emit(Loaded(newsList: newsList)),
      );
    });

    on<DeleteSelectedSavedNewsEvent>((event, emit) async {
      emit(Loading());
      final response = await savedNewsUseCase.deleteSelectedNews(
        PublicNewsParams(selectedModels: event.selectedNews),
      );
      response.fold(
        (l) => emit(Error(errorMessage: l.errorMessage)),
        (newsList) => emit(Loaded(newsList: newsList)),
      );
    });
  }
}
