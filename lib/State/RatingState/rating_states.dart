
part of 'rating_bloc.dart';

abstract class RatingState {}

class RatingInitialState extends RatingState {}

class RatingLoadingState extends RatingState {}

class RatingSuccessState extends RatingState {
  final Book updatedBook;

  RatingSuccessState({required this.updatedBook});
}

class RatingErrorState extends RatingState {
  final String error;

  RatingErrorState({required this.error});
}