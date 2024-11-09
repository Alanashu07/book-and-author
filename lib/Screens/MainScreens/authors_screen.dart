import 'package:book_and_author/Widgets/Loading/author_tile_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../State/AuthorState/Bloc/authors_screen_bloc.dart';
import '../../State/AuthorState/Bloc/authors_screen_states.dart';
import '../../Widgets/AuthorWidgets/author_tile.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AuthorsScreenBloc>(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Authors',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<AuthorsScreenBloc, AuthorsScreenState>(
          bloc: BlocProvider.of<AuthorsScreenBloc>(context),
          builder: (context, state) {
            if (state is AuthorsScreenInitialState) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                itemBuilder: (context, index) {
                  return const AuthorTileLoading();
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: 10,
              );
            } else if (state is AuthorsScreenLoadingState) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                itemBuilder: (context, index) {
                  return const AuthorTileLoading();
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: 10,
              );
            } else if (state is AuthorsScreenLoadedState) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                itemBuilder: (context, index) {
                  return AuthorTile(
                    author: state.authors[index],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: state.authors.length,
              );
            } else if (state is AuthorsScreenErrorState) {
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
