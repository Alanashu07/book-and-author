import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:book_and_author/State/BookDetailsState/book_details_bloc.dart';
import 'package:book_and_author/State/BookDetailsState/book_details_events.dart';
import 'package:book_and_author/State/BookState/Bloc/books_screen_bloc.dart';
import 'package:book_and_author/State/BookState/Bloc/books_screen_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:book_and_author/Models/book_model.dart';

import '../../main.dart';
part 'rating_events.dart';
part 'rating_states.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final http.Client httpClient;

  RatingBloc({required this.httpClient}) : super(RatingInitialState()) {
    on<RatingAddedEvent>(_onRatingAdded);
  }

  Future<void> _onRatingAdded(
      RatingAddedEvent event,
      Emitter<RatingState> emit,
      ) async {
    emit(RatingLoadingState());
    try {
      final url = Uri.parse("https://assessment.eltglobal.in/api/books/${event.bookId}/ratings:add");
      final response = await http.patch(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      }, body: jsonEncode({'rating': event.rating.toInt()}));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final updatedBook = Book.fromJson(data['result']);
        emit(RatingSuccessState(updatedBook: updatedBook));
      } else {
        emit(RatingErrorState(error: 'Failed to add rating'));
      }
    } catch (e) {
      emit(RatingErrorState(error: '$e'));
    }
  }
}