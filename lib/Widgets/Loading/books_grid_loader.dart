import 'package:book_and_author/Widgets/Loading/image_loader.dart';
import 'package:flutter/material.dart';

class BooksGridLoader extends StatelessWidget {
  const BooksGridLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.black12, width: .4),
            right: BorderSide(color: Colors.black12, width: .4),
            left: BorderSide(color: Colors.black12, width: .4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(18.0),
              child: const ImageLoader(),
            ),
          ),
          const ImageLoader(width: double.infinity, height: 18,),
          const ImageLoader(width: double.infinity, height: 16,),
          const ImageLoader(width: double.infinity, height: 16,),
          const SizedBox(
            height: 5,
          ),
          const ImageLoader(width: double.infinity, height: 16,),
        ],
      ),
    );
  }
}
