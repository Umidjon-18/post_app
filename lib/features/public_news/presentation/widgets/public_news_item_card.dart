import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/local_database/local_database.dart';
import '../bloc/public_news_bloc.dart';

class PublicNewsItemCard extends StatefulWidget {
  const PublicNewsItemCard({
    super.key,
    required this.newsItem,
  });

  final PublicNew newsItem;

  @override
  State<PublicNewsItemCard> createState() => _PublicNewsItemCardState();
}

class _PublicNewsItemCardState extends State<PublicNewsItemCard> {
  void like() {
    context.read<PublicNewsBloc>().add(SaveSingleNewsEvent(context, widget.newsItem));
  }

  late var date = DateFormat('EEEE, MMMM d, y').format(DateTime.parse(widget.newsItem.date??""));

  @override
  Widget build(BuildContext context) {
    return Container(
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
              alignment: Alignment.bottomRight,
              children: [
                CachedNetworkImage(
                  height: 250,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  imageUrl: widget.newsItem.jetpackFeaturedMediaUrl??"",
                  placeholder: (context, url) => const Center(child: CupertinoActivityIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: IconButton(
                    onPressed: like,
                    icon: const Icon(
                      Icons.cloud_download,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => context.pushNamed("newsItemPage", extra: widget.newsItem),
            child: Text(
              widget.newsItem.title??"",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
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
    );
  }
}
