import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_books.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{

  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBooks({int pageNum = 0});

  Future<List<BookEntity>> fetchSimilarBooks({String category = "all"});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{

  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {

    var data = await  apiService.get(endPoint: "volumes?q=artificial intelligence&Filtering=free-ebooks&Sorting=newest&startIndex=${pageNumber*10}");

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books,featuredBox);

    return books;
  }


  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNum = 0}) async {

    var data = await  apiService.get(endPoint: "volumes?Filtering=free-ebooks&Sorting=newest&q=artificial intelligence&startIndex=${pageNum * 10}");

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books,newestBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({String category = "all"}) async {
    var data = await  apiService.get(endPoint: "volumes?q=$category&Filtering=free-ebooks&Sorting=newest");

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books,similarBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var bookMap in data['items']){
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

}