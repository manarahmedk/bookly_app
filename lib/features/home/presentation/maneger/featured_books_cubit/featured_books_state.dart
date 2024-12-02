part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksPaginationLoading extends FeaturedBooksState {}
class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFailure(this.errorMessage);
}
class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailure(this.errorMessage);
}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}
