import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../public_news/data/models/public_news_model.dart';
import '../bloc/saved_news_bloc/saved_news_bloc.dart';

class SavedNewsItemCard extends StatefulWidget {
  const SavedNewsItemCard({
    super.key,
    required this.newsItem,
  });

  final PublicNewsModel newsItem;

  @override
  State<SavedNewsItemCard> createState() => _SavedNewsItemCardState();
}

class _SavedNewsItemCardState extends State<SavedNewsItemCard> {
  void delete() {
    context.read<SavedNewsBloc>().add(DeleteSavedNewsEvent(context, newsModel: widget.newsItem));
  }

  late var date = DateFormat('EEEE, MMMM d, y').format(DateTime.parse(widget.newsItem.date));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed("newsItemPage", extra: widget.newsItem),
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 8, 47, 66),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CachedNetworkImage(
                    height: 250,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    imageUrl: widget.newsItem.jetpackFeaturedMediaUrl,
                    placeholder: (context, url) => const Center(child: CupertinoActivityIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: IconButton(
                      onPressed: delete,
                      icon: const Icon(
                        CupertinoIcons.delete_solid,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.newsItem.title.rendered,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                date.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
