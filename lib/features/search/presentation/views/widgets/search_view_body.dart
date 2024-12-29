import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/setup_sevice_locator.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_text_feild.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(SearchRepoImpl(getIt.get<ApiService>())),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField(),
            SizedBox(
              height: 16,
            ),
            Text(
              "Search Result",
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: SearchResultListView(),
            ),
          ],
        ),
      ),
    );
  }
}
