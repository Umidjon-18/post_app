import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:post_app/features/public_news/presentation/bloc/public_news_bloc.dart';
import 'package:post_app/utils/utils.dart';

import '../widgets/public_news_item_card.dart';

class PublicNewsPage extends StatefulWidget {
  const PublicNewsPage({super.key});

  @override
  State<PublicNewsPage> createState() => _PublicNewsPageState();
}

class _PublicNewsPageState extends State<PublicNewsPage> {
  List<PublicNewsModel> tempList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Public News"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<PublicNewsBloc>().add(GetPublicNewsEvent(
                newsCount: 50,
                newsList: tempList,
              ));
        },
        child: BlocConsumer<PublicNewsBloc, PublicNewsState>(
          listener: (context, state) {
            if (state is Loading) {
              context.show();
            } else if (state is Loaded) {
              context.pop();
            } else {
              if (state is Error) {
                state.errorMessage ?? "Something went wrong".showToastWidget();
              }
            }
          },
          builder: (context, state) {
            if (state is Initial) {
              context.read<PublicNewsBloc>().add(GetPublicNewsEvent(newsCount: 50, newsList: const []));
              return Container();
            } else if (state is Loading || state is Loaded) {
              tempList = state.newsList;
              return ListView.builder(
                itemCount: state.newsList.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  var newsItem = state.newsList[index];
                  return PublicNewsItemCard(newsItem: newsItem);
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
