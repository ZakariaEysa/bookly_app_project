import '../../../Features/home/data/models/book_model/book_model.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../Features/home/domain/entities/book_entity.dart';

Future<void> saveBoxData(List<BookModel> books, String booksName) async {
    var box = await Hive.openBox<BookEntity>(booksName);
    box.addAll(books);
  }