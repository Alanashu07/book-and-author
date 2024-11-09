import 'package:book_and_author/Widgets/Loading/books_grid_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../State/BookState/Bloc/books_screen_bloc.dart';
import '../../State/BookState/Bloc/books_screen_states.dart';
import '../../Widgets/TextFields/search_field.dart';
import '../../Widgets/books_grid.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<BooksScreenBloc>(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'App name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<BooksScreenBloc, BooksScreenState>(
          bloc: BlocProvider.of<BooksScreenBloc>(context),
          builder: (context, state) {
            if (state is BooksScreenInitialState) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.6),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const BooksGridLoader();
                },
              );
            } else if (state is BooksScreenLoadingState) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.6),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const BooksGridLoader();
                },
              );
            } else if (state is BooksScreenLoadedState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                      child: SearchField(
                        controller: searchController,
                        onSubmitted: (value) => GoRouter.of(context).push('/search?query=$value'),
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.6),
                      itemCount: state.books.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BooksGrid(book: state.books[index]);
                      },
                    )
                  ],
                ),
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
    );
  }
}