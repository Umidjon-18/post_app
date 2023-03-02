import 'package:go_router/go_router.dart';
import 'package:post_app/core/pages/main_page.dart';
import 'package:post_app/features/public_news/presentation/pages/news_item_page.dart';

import '../local_database/local_database.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: "/newsItemPage",
      name: "newsItemPage",
      builder: (context, state){
        PublicNew newsModel = state.extra as PublicNew;
        return NewsItemPage(newsModel: newsModel);
      },
    ),
  ],
);
