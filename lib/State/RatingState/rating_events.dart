part of 'rating_bloc.dart';

abstract class RatingEvent {}

class RatingAddedEvent extends RatingEvent {
  final String bookId;
  final double rating;
  final Book book;
  final BuildContext context;

  RatingAddedEvent(
      {required this.bookId,
      required this.rating,
      required this.book,
      required this.context});
}
