import 'package:book_and_author/Models/author_model.dart';
import 'package:book_and_author/Style/app_style.dart';
import 'package:flutter/material.dart';

class AuthorTile extends StatelessWidget {
  final Author author;

  const AuthorTile({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    int colorIndex = AppStyle.getRandomIndex();
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppStyle.authorColors[colorIndex].withOpacity(0.2),
            child: Text(
              author.name.split('').first.toUpperCase(),
              style: TextStyle(
                  color: AppStyle.authorColors[colorIndex],
                  fontWeight: FontWeight.w900,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                author.biography,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
