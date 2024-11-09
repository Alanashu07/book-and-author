import 'package:book_and_author/Widgets/Loading/image_loader.dart';
import 'package:flutter/material.dart';

class BooksDetailsLoader extends StatelessWidget {
  const BooksDetailsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Column(
      children: [
        ImageLoader(
          height: mq.height * .45,
          width: mq.width,
        ),
        const SizedBox(height: 35,),
        ImageLoader(
          height: mq.height * .05,
          width: mq.width,
        ),
        const SizedBox(height: 35,),
        const Expanded(child: ImageLoader()),
        SizedBox(
          height: mq.height * .02,
        )
      ],
    );
  }
}
