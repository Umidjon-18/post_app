import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/public_news_bloc.dart';
import '../../../../utils/utils.dart';

import '../../../../core/local_database/local_database.dart';
import '../widgets/public_news_item_card.dart';

class PublicNewsPage extends StatefulWidget {
  const PublicNewsPage({super.key});

  @override
  State<PublicNewsPage> createState() => _PublicNewsPageState();
}

class _PublicNewsPageState extends State<PublicNewsPage> {
  List<PublicNew> tempList = [];
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
              return AnimationList(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: List.generate(
                  state.newsList.length,
                  (index) => PublicNewsItemCard(
                    newsItem: state.newsList[index],
                  ),
                ),
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
