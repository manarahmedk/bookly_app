import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks(
      {required String bookTitle}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?q=subject:$bookTitle&Filtering=free-ebooks&Sorting=newest&key=AIzaSyAjEz5M60bEgT4UvUhNuCMDl4rADhiT3a0');
      List<BookEntity> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
