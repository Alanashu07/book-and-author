import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:book_and_author/Models/book_model.dart';
import 'books_screen_events.dart';
import 'books_screen_states.dart';

class BooksScreenBloc extends Bloc<BooksScreenEvent, BooksScreenState> {
  final http.Client _httpClient;
  final int _limit;

  BooksScreenBloc({required http.Client httpClient, required int limit})
      : _httpClient = httpClient,
        _limit = limit,
        super(BooksScreenInitialState()) {
    on<FetchBooksEvent>(_onFetchBooks);
  }

  Future<void> _onFetchBooks(
      FetchBooksEvent event,
      Emitter<BooksScreenState> emit,
      ) async {
    emit(BooksScreenLoadingState());
    try {
      final url = 'https://assessment.eltglobal.in/api/books?page=1&limit=$_limit';
      final response = await _httpClient.get(Uri.parse(url));
      final books = (jsonDecode(response.body)['result'] as List)
          .map((e) => Book.fromJson(e))
          .toList();
      emit(BooksScreenLoadedState(books: books));
    } catch (e) {
      emit(BooksScreenErrorState(error: 'Error: $e'));
    }
  }
}