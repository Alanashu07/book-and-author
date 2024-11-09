import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  final String description;

  const BookDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      width: mq.width,
      padding: const EdgeInsets.all(18.0),
      child: Text(
        description,
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
