import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'book_details_events.dart';
import 'book_details_states.dart';
import 'package:book_and_author/Models/book_model.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  final http.Client _httpClient;

  BookDetailsBloc({required http.Client httpClient})
      : _httpClient = httpClient,
        super(BookDetailsInitialState()) {
    on<BookDetailsFetchEvent>(_onFetchBookDetails);
    on<UpdateBookEvent>(_onUpdateBook);
  }

  Future<void> _onFetchBookDetails(
      BookDetailsFetchEvent event,
      Emitter<BookDetailsState> emit,
      ) async {
    emit(BookDetailsLoadingState());
    try {
      final url = Uri.parse("https://assessment.eltglobal.in/api/books/${event.id}");
      final response = await _httpClient.get(url);
      final book = Book.fromJson(jsonDecode(response.body)['result']);
      emit(BookDetailsLoadedState(book: book));
    } catch (e) {
      emit(BookDetailsErrorState(error: '$e'));
    }
  }

  Future<void> _onUpdateBook(
      UpdateBookEvent event,
      Emitter<BookDetailsState> emit,
      ) async {
    emit(BookDetailsUpdatedState(updatedBook: event.updatedBook));
  }
}