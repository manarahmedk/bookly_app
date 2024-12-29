part of 'search_books_cubit.dart';

abstract class SearchBooksState {}

class SearchBooksInitial extends SearchBooksState {}

class SearchBooksLoading extends SearchBooksState {}

class SearchBooksFailure extends SearchBooksState {
  final String errorMessage;

  SearchBooksFailure(this.errorMessage);
}

class SearchBooksSuccess extends SearchBooksState {
  final List<BookEntity> books;

  SearchBooksSuccess(this.books);
}
