import 'package:bookly_app/core/utils/functions/build_error_snack_error.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/maneger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListViewBlocConsumer extends StatefulWidget {
  const SimilarBooksListViewBlocConsumer({
    super.key, required this.book,
  });

  final BookEntity book;

  @override
  State<SimilarBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<SimilarBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is SimilarBooksFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildErrorSnackBar(state.errorMessage));
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListView(
            books: books,
            book: widget.book,
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
