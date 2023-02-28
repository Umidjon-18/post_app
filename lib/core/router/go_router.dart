import 'package:go_router/go_router.dart';
import 'package:post_app/features/public_news/presentation/pages/public_news_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const PublicNewsPage(),
    ),
  ],
);
