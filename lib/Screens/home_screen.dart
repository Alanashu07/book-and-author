import 'package:book_and_author/State/BookState/Bloc/books_screen_bloc.dart';
import 'package:book_and_author/State/BookState/Bloc/books_screen_events.dart';
import 'package:book_and_author/Style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../State/AuthorState/Bloc/authors_screen_bloc.dart';
import '../State/AuthorState/Bloc/authors_screen_events.dart';
import 'MainScreens/authors_screen.dart';
import 'MainScreens/books_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void onNavigate(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    context.read<AuthorsScreenBloc>().add(FetchAuthorsEvent());
    context.read<BooksScreenBloc>().add(FetchBooksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          index: currentIndex,
          children: const [BooksScreen(), AuthorsScreen()]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/selected_home.png'),
            icon: Image.asset('images/unselected_home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset('images/selected_author.png'),
            icon: Image.asset('images/unselected_author.png'),
            label: 'Authors',
          ),
        ],
        selectedItemColor: AppStyle.mainColor,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: onNavigate,
      ),
    );
  }
}
