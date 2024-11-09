import '../../Models/book_model.dart';

abstract class BookDetailsEvent {}

class BookDetailsFetchEvent extends BookDetailsEvent {
  final String id;

  BookDetailsFetchEvent({required this.id});
}

class UpdateBookEvent extends BookDetailsEvent {
  final Book updatedBook;

  UpdateBookEvent({required this.updatedBook});
}