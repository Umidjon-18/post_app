import 'package:flutter/material.dart';
import 'package:post_app/features/saveds/presentation/pages/saved_facts_page.dart';
import 'package:post_app/features/saveds/presentation/pages/saved_images_page.dart';
import 'package:post_app/features/saveds/presentation/pages/saved_news_page.dart';
import 'package:post_app/features/saveds/presentation/pages/saved_words_page.dart';

class SavedsPage extends StatefulWidget {
  const SavedsPage({super.key});

  @override
  State<SavedsPage> createState() => _SavedsPageState();
}

class _SavedsPageState extends State<SavedsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          SavedNewsPage(),
          SavedImagesPage(),
          SavedFactsPage(),
          SavedWordsPage(),
        ],
      ),
    );
  }
}
