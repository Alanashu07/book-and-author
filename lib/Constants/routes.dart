import 'package:book_and_author/Screens/search_screen.dart';
import 'package:book_and_author/Screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../Screens/Authentication/login_screen.dart';
import '../Screens/Authentication/register_screen.dart';
import '../Screens/MainScreens/authors_screen.dart';
import '../Screens/MainScreens/books_screen.dart';
import '../Screens/books_details.dart';
import '../Screens/home_screen.dart';


class Routes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String books = '/books';
  static const String authors = '/authors';
  static const String booksDetails = '/booksDetails/:id';

  static final _routerKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _routerKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: books,
        builder: (context, state) => const BooksScreen(),
      ),
      GoRoute(
        path: authors,
        builder: (context, state) => const AuthorsScreen(),
      ),
      GoRoute(path: booksDetails, builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BooksDetails(id: id,);
      }),
      GoRoute(path: '/search', builder: (context, state) {
        final query = state.uri.queryParameters['query'] ?? '';
        return SearchScreen(query: query);
      },)
    ],
  );
}