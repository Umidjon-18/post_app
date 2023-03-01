import 'package:flutter/material.dart';
import 'package:post_app/features/public_news/presentation/pages/public_news_page.dart';

import '../../features/saveds/presentation/pages/saveds_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
     int currentIndex = 0;
    void changePage(int newIndex) {
      setState(() {
        currentIndex = newIndex;
      });
    }

    List<Widget> pages = [
      const PublicNewsPage(),
      const SavedsPage(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: "Saved"
          ),
        ],
        currentIndex: currentIndex,
        onTap: changePage,
      ),
    );
  }
}
