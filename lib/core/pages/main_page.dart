import 'package:flutter/material.dart';
import '../../features/public_news/presentation/pages/public_news_page.dart';

import '../../features/saveds/presentation/pages/saveds_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  void changePage(int newIndex) {
    pageController.jumpToPage(newIndex);
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
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
        ],
        currentIndex: currentIndex,
        onTap: changePage,
      ),
    );
  }
}
