import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/maneger/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key, required this.books, required this.book});

  final List<BookEntity> books;
  final BookEntity book;

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  @override
  void initState() {
    _fetchSimilarBooks();
    super.initState();
  }

  void _fetchSimilarBooks() async {
    await BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.book.category ?? 'all').then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.bookDetailsView,
                            extra:widget.books[index]);
                      },
                      child: CustomBookImage(
                        image: widget.books[index].image ?? "",
                      )),
                );
              },
            ),
          );
        }
  }
