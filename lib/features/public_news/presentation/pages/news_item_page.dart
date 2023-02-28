import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItemPage extends StatefulWidget {
  const NewsItemPage({super.key});

  @override
  State<NewsItemPage> createState() => _NewsItemPageState();
}

class _NewsItemPageState extends State<NewsItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Item Page"),
      ),
      body: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
