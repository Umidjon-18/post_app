import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_app/features/saveds/presentation/bloc/saved_news_bloc/saved_news_bloc.dart';
import 'package:post_app/features/saveds/presentation/widgets/saved_news_item_card.dart';
import 'package:post_app/utils/utils.dart';

import '../../../public_news/data/models/public_news_model.dart';

class SavedNewsPage extends StatefulWidget {
  const SavedNewsPage({super.key});

  @override
  State<SavedNewsPage> createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
  List<PublicNewsModel> tempList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved News Page"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<SavedNewsBloc>().add(
                GetSavedNewsEvent(newsList: tempList),
              );
        },
        child: BlocConsumer<SavedNewsBloc, SavedNewsState>(
          listener: (context, state) {
            if (state is Loading) {
              context.show();
            } else if (state is Loaded) {
              context.back();
            } else {
              if (state is Error) {
                state.errorMessage ?? "Something went wrong".showToastWidget();
              }
            }
          },
          builder: (context, state) {
            if (state is Initial) {
              context.read<SavedNewsBloc>().add(GetSavedNewsEvent(newsList: tempList));
              return Container();
            } else if (state is Loading || state is Loaded) {
              tempList = state.newsList;
              return ListView.builder(
                itemCount: state.newsList.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  var newsItem = state.newsList[index];
                  return SavedNewsItemCard(newsItem: newsItem);
                },
              );
            } else {
              return Center(
                child: Text(
                  "${(state as Error).errorMessage}",
                  style: const TextStyle(fontSize: 22),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
