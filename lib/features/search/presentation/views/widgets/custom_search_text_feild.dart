import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    SearchBooksCubit searchBooksCubit = SearchBooksCubit.get(context);
    return TextField(
      controller: searchBooksCubit.searchController,
      onChanged: (value) {
        searchBooksCubit.searchController.text = value;
        searchBooksCubit.bookTitle = value;
      },
      onSubmitted: (value) {
        searchBooksCubit.getSearchedBooks(bookTitle: value);
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            searchBooksCubit.getSearchedBooks(bookTitle: searchBooksCubit.searchController.text);
          },
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
