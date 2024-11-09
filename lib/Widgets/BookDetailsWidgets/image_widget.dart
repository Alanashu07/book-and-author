import 'package:book_and_author/Style/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Loading/image_loader.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  const ImageWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery
        .of(context)
        .size;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(22),
      height: mq.height * .45,
      width: mq.width,
      color: AppStyle.bookColors[AppStyle.getRandomIndex()],
      child: CachedNetworkImage(
          imageUrl: image, placeholder: (context, url) => const ImageLoader(),
          errorWidget: (context, url, error) => const Icon(Icons.error)),
    );
  }
}
