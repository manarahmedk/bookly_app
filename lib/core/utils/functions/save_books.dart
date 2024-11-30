import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

void saveBooksData(List<BookEntity> books ,String boxName) {

  var box = Hive.box<BookEntity>(boxName);

  box.addAll(books);

}