import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/features/public_news/data/datasources/local/localsource.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:post_app/features/public_news/domain/usecases/delete_public_news_usecase.dart';
import 'package:post_app/features/public_news/domain/usecases/get_public_news_usecase.dart';
import 'package:post_app/features/public_news/domain/usecases/save_public_news_usecase.dart';

part 'public_news_event.dart';
part 'public_news_state.dart';

class PublicNewsBloc extends Bloc<PublicNewsEvent, PublicNewsState> {
  final GetPublicNewsUseCase getPublicNewsUseCase;
  final DeletePublicNewsUseCase deletePublicNewsUseCase;
  final SavePublicNewsUseCase savePublicNewsUseCase;
  PublicNewsBloc({
    required this.getPublicNewsUseCase,
    required this.deletePublicNewsUseCase,
    required this.savePublicNewsUseCase,
  }) : super(Initial()) {
    on<GetPublicNewsEvent>((event, emit) async {
      emit(Loading(newsList: event.newsList));
      final response = await getPublicNewsUseCase(event.newsCount);
      response.fold(
        (l) => emit(Error(l.errorMessage)),
        (r) => emit(Loaded(newsList: r)),
      );
    });
    on<SaveSingleNewsEvent>((event, emit) async {
      final response = await savePublicNewsUseCase(
        PublicNewsParams(newsModel: event.newsModel),
      );
      response.fold(
        (l) {
          showSnackBar(event.context, l.errorMessage ?? "Something went wrong");
        },
        (r) {
          showSnackBar(event.context, "Successfully saved");
        },
      );
    });
    on<SaveSelectedNewsEvent>((event, emit) async {
      final response = await savePublicNewsUseCase.saveSelectedNews(event.selectedNews);
      response.fold(
        (l) {
          showSnackBar(event.context, l.errorMessage ?? "Something went wrong");
        },
        (r) {
          showSnackBar(event.context, "Successfully saved");
        },
      );
    });
  }

  Future<void> showSnackBar(BuildContext ctx, String message) async {
    ScaffoldMessenger.of(ctx).clearSnackBars();
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
  }
}
