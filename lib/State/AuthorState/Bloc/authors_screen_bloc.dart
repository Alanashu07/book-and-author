import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:book_and_author/Models/author_model.dart';
import 'authors_screen_events.dart';
import 'authors_screen_states.dart';

class AuthorsScreenBloc extends Bloc<AuthorsScreenEvent, AuthorsScreenState> {
  final http.Client _httpClient;

  AuthorsScreenBloc({required http.Client httpClient})
      : _httpClient = httpClient,
        super(AuthorsScreenInitialState()) {
    on<FetchAuthorsEvent>(_onFetchAuthors);
  }

  Future<void> _onFetchAuthors(
      FetchAuthorsEvent event,
      Emitter<AuthorsScreenState> emit,
      ) async {
    emit(AuthorsScreenLoadingState());
    try {
      const url = 'https://assessment.eltglobal.in/api/authors';
      final response = await _httpClient.get(Uri.parse(url));
      final authors = (jsonDecode(response.body)['result'] as List)
          .map((e) => Author.fromJson(e))
          .toList();
      emit(AuthorsScreenLoadedState(authors: authors));
    } catch (e) {
      emit(AuthorsScreenErrorState(error: 'Error: $e'));
    }
  }
}