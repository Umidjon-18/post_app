import 'package:flutter/material.dart';
import '../../../public_news/presentation/pages/saved_news_page.dart';

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
        ],
      ),
    );
  }
}
