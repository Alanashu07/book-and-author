import '../../../Models/author_model.dart';


abstract class AuthorsScreenState {}

class AuthorsScreenInitialState extends AuthorsScreenState {}

class AuthorsScreenLoadingState extends AuthorsScreenState {}

class AuthorsScreenLoadedState extends AuthorsScreenState {
  final List<Author> authors;

  AuthorsScreenLoadedState({required this.authors});
}

class AuthorsScreenErrorState extends AuthorsScreenState {
  final String error;

  AuthorsScreenErrorState({required this.error});
}