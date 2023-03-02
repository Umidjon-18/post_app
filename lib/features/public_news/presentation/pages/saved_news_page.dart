import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import '../../../../core/local_database/daos/public_news_dao.dart';
import '../../../../core/local_database/local_database.dart';
import '../../../../injection_container.dart';

import '../../../saveds/presentation/widgets/saved_news_item_card.dart';


class SavedNewsPage extends StatefulWidget {
  const SavedNewsPage({super.key});

  @override
  State<SavedNewsPage> createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
  List<PublicNew> tempList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved News Page"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: StreamBuilder(
          stream: sl<PublicNewsDao>().watchAllNews(),
          builder: (context, snapshot) {
            var data = snapshot.data ?? <PublicNew>[];
            return AnimationList(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: List.generate(data.length, (index) => SavedNewsItemCard(newsItem: data[index])),
            );
          },
        ),
      ),
    );
  }
}
