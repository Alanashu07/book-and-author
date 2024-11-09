import 'package:book_and_author/State/BookState/Bloc/books_screen_bloc.dart';
import 'package:book_and_author/Widgets/TextFields/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../State/BookState/Bloc/books_screen_states.dart';
import '../Widgets/books_grid.dart';

class SearchScreen extends StatefulWidget {
  final String query;

  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    //initial text of the controller will be the text passed by the user
    searchController.text = widget.query;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(GoRouter.of(context).canPop()) {
          GoRouter.of(context).pop();
        } else {
          GoRouter.of(context).go('/home');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            if(GoRouter.of(context).canPop()) {
              GoRouter.of(context).pop();
            } else {
              GoRouter.of(context).go('/home');
            }
          }, icon: const Icon(CupertinoIcons.back)),
          title: SearchField(controller: searchController, onSubmitted: (value) => context.go('/search?query=$value'),),
        ),
        body: BlocProvider.value(
          value: BlocProvider.of<BooksScreenBloc>(context),
          child: BlocBuilder<BooksScreenBloc, BooksScreenState>(
            bloc: BlocProvider.of<BooksScreenBloc>(context),
            builder: (context, state) {
              if (state is BooksScreenInitialState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BooksScreenLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BooksScreenLoadedState) {
                final books = state.books
                    .where((element) =>
                        element.title
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()) ||
                        element.description
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()))
                    .toList();
                return GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.6),
                  itemCount: books.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BooksGrid(book: books[index]);
                  },
                );
              } else if (state is BooksScreenErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              return const Center(child: Text('Unknown state'));
            },
          ),
        ),
      ),
    );
  }
}
