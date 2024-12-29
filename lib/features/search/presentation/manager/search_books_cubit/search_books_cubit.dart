import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  static SearchBooksCubit get(context) => BlocProvider.of<SearchBooksCubit>(context);

  TextEditingController searchController = TextEditingController();

  String bookTitle = '';

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  Future<void> getSearchedBooks({required String bookTitle}) async {
    emit(SearchBooksLoading());

    var result = await searchRepo.fetchSearchedBooks(bookTitle: bookTitle);
    result.fold(
        (failure) {
          if(bookTitle.isEmpty || searchController.text.isEmpty){
            emit(SearchBooksInitial());
          } else{
            emit(SearchBooksFailure(failure.message));
          }
        },
        (books) => emit(SearchBooksSuccess(books)));
  }
}
