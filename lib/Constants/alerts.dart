import 'package:book_and_author/Widgets/Buttons/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Models/book_model.dart';
import '../State/BookDetailsState/book_details_bloc.dart';
import '../State/BookDetailsState/book_details_events.dart';
import '../State/RatingState/rating_bloc.dart';


//for showing snackbar whenever needed
void showSnackBar(
    {required BuildContext context,
    required String content,
    Color color = Colors.deepOrange}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: color,
  ));
}



//for showing alerts
void showAlert({
  required BuildContext context,
  required String title,
  required String content,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'))
        ],
      );
    },
  );
}


//Rating function for adding rating to the book
void addRating({required BuildContext context, required Book book}) {
  final mq = MediaQuery.of(context).size;
  double rating = 0;
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 350,
        width: mq.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Container(
              width: mq.width * .1,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black38),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0),
              child: Text(
                'Add rating',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            const Divider(
              color: Colors.black12,
            ),
            StatefulBuilder(builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RatingBar(
                  initialRating: 0,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                  itemSize: mq.width * .11,
                  direction: Axis.horizontal,
                  ratingWidget: RatingWidget(
                      full: const Icon(
                        Icons.star,
                        color: CupertinoColors.systemYellow,
                      ),
                      half: const Icon(
                        CupertinoIcons.star_lefthalf_fill,
                        color: CupertinoColors.systemYellow,
                      ),
                      empty: const Icon(
                        Icons.star,
                        color: CupertinoColors.systemGrey,
                      )),
                  onRatingUpdate: (value) {
                    state(() {
                      rating = value;
                    });
                  },
                ),
              );
            }),
            const Divider(color: Colors.black12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: CustomButton(onTap: () {
                Navigator.pop(context);
                context.read<RatingBloc>().add(RatingAddedEvent(
                  bookId: book.id,
                  rating: rating,
                  book: book,
                  context: context
                ));
                context.read<BookDetailsBloc>().add(BookDetailsFetchEvent(id: book.id));
              }, child: const Text('Submit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),)),
            )
          ],
        ),
      );
    },
  );
}
