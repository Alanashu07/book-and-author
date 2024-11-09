import '../../../Models/book_model.dart';


abstract class BooksScreenState {}

class BooksScreenInitialState extends BooksScreenState {}

class BooksScreenLoadingState extends BooksScreenState {}

class BooksScreenLoadedState extends BooksScreenState {
  final List<Book> books;

  BooksScreenLoadedState({required this.books});
}

class BooksScreenErrorState extends BooksScreenState {
  final String error;

  BooksScreenErrorState({required this.error});
}