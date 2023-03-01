import 'package:flutter/material.dart';
import 'package:post_app/features/public_news/data/models/public_news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class NewsItemPage extends StatefulWidget {
  const NewsItemPage({super.key, required this.newsModel});
  final PublicNewsModel newsModel;

  @override
  State<NewsItemPage> createState() => _NewsItemPageState();
}

class _NewsItemPageState extends State<NewsItemPage> {
  late WebViewController controller = WebViewController()..loadRequest(Uri.parse(widget.newsModel.link));

  @override
  void dispose() {
    controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.rendered),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
