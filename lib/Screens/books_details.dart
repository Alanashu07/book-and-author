import 'package:book_and_author/Widgets/BookDetailsWidgets/book_description.dart';
import 'package:book_and_author/Widgets/BookDetailsWidgets/book_price.dart';
import 'package:book_and_author/Widgets/BookDetailsWidgets/books_header.dart';
import 'package:book_and_author/Widgets/BookDetailsWidgets/image_widget.dart';
import 'package:book_and_author/Widgets/Loading/books_details_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../State/BookDetailsState/book_details_bloc.dart';
import '../State/BookDetailsState/book_details_events.dart';
import '../State/BookDetailsState/book_details_states.dart';

class BooksDetails extends StatefulWidget {
  final String id;

  const BooksDetails({super.key, required this.id});

  @override
  State<BooksDetails> createState() => _BooksDetailsState();
}

class _BooksDetailsState extends State<BooksDetails> {

  @override
  void initState() {
    super.initState();
    context.read<BookDetailsBloc>().add(BookDetailsFetchEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: BlocProvider.of<BookDetailsBloc>(context),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                if(GoRouter.of(context).canPop()) {
                  GoRouter.of(context).pop();
                } else {
                  GoRouter.of(context).go('/home');
                }
              },
              icon: const Icon(CupertinoIcons.back)),
        ),
        body: BlocBuilder<BookDetailsBloc, BookDetailsState>(
            bloc: BlocProvider.of<BookDetailsBloc>(context),
            builder: (context, state) {
              if (state is BookDetailsLoadingState) {
                return const BooksDetailsLoader();
              } else if (state is BookDetailsLoadedState) {
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [

                          //Image with a random color background
                          ImageWidget(image: state.book.coverPictureUrl),

                          //Books Name, and Author Name
                          BooksHeader(book: state.book),

                          //Book Description
                          BookDescription(description: state.book.description),

                          //Just a space for not overlapping with the bottom
                          SizedBox(
                            height: mq.height * .12,
                          )
                        ],
                      ),
                    ),

                    //Book Price
                    Positioned(
                        bottom: 0,
                        child: BookPrice(
                          book: state.book,
                        ))
                  ],
                );
              } else if (state is BookDetailsErrorState) {
                return Center(child: Text(state.error));
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
