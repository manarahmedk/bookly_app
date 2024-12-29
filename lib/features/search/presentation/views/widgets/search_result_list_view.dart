import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../home/presentation/views/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  GoRouter.of(context).push(AppRouter.bookDetailsView,extra: state.books[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(
                    image: state.books[index].image ?? "",
                    author: state.books[index].authorName ?? "",
                    title: state.books[index].title,
                    rating: state.books[index].rating ?? 0,
                    ratingsCount: state.books[index].ratingsCount ?? 0,
                  ),
                ),
              );
            },
          );
        } else if(state is SearchBooksFailure) {
           return const Center(child: Text("The Book is Not Found"),);
        } else if(state is SearchBooksInitial) {
          return const Center(child: Text('Search For a Book',),);
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
