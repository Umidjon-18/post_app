import 'package:go_router/go_router.dart';
import 'package:post_app/core/pages/main_page.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:post_app/features/public_news/presentation/pages/news_item_page.dart';

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
        PublicNewsModel newsModel = state.extra as PublicNewsModel;
        return NewsItemPage(newsModel: newsModel);
      },
    ),
  ],
);
