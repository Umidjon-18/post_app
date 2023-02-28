import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:post_app/features/public_news/presentation/bloc/public_news_bloc.dart';
import 'package:post_app/utils/utils.dart';

import '../../../../injection_container.dart';

class PublicNewsPage extends StatefulWidget {
  const PublicNewsPage({super.key});

  @override
  State<PublicNewsPage> createState() => _PublicNewsPageState();
}

class _PublicNewsPageState extends State<PublicNewsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PublicNewsBloc>(
      create: (context) => sl(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Public News"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<PublicNewsBloc>().add(GetPublicNewsEvent(newsCount: 50));
          },
          child: BlocConsumer<PublicNewsBloc, PublicNewsState>(
            listener: (context, state) {
              if (state is Loading) {
                context.show();
                "Loading".showToastWidget();
              } else if (state is Loaded) {
                context.pop();
              } else {
                "error".showToastWidget();
              }
            },
            builder: (context, state) {
              if (state is Initial) {
                context.read<PublicNewsBloc>().add(GetPublicNewsEvent(newsCount: 50));
                return Container();
              } else if (state is Loading || state is Loaded) {
                return ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.maxFinite,
                      height: 100,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      color: Colors.green,
                    );
                  },
                );
              } else {
                return Text(
                  "${(state as Error).errorMessage} 111",
                  style: const TextStyle(fontSize: 22),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
