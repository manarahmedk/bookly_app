import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';
import 'similer_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                  child: const CustomBookImage(),
                ),
                const SizedBox(
                  height: 43,
                ),
                const Text(
                  "The Jungle Book",
                  style: Styles.textStyle30,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Opacity(
                  opacity: 0.7,
                  child: Text(
                    "Rudyard Kipling",
                    style: Styles.textStyle18,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                const BooksAction(),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

