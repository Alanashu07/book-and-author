import '../../Models/book_model.dart';


abstract class BookDetailsState {}

class BookDetailsInitialState extends BookDetailsState {}

class BookDetailsLoadingState extends BookDetailsState {}

class BookDetailsLoadedState extends BookDetailsState {
  final Book book;

  BookDetailsLoadedState({required this.book});
}

class BookDetailsUpdatedState extends BookDetailsState {
  final Book updatedBook;

  BookDetailsUpdatedState({required this.updatedBook});
}

class BookDetailsErrorState extends BookDetailsState {
  final String error;

  BookDetailsErrorState({required this.error});
}