import 'package:book_and_author/Constants/alerts.dart';
import 'package:book_and_author/Widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/book_model.dart';

class BookPrice extends StatelessWidget {
  final Book book;

  const BookPrice({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      height: 70,
      width: mq.width,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '₹ ${book.price}.00',
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          CustomButton(
              width: mq.width * .25,
              height: 40,
              onTap: () => addRating(context: context, book: book),
              child: const Text(
                'Add rating',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
