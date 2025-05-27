import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../../../../constants.dart';
import '../../domain/entities/book_entity.dart';

List<BookEntity> favorites = [];

class FavoritesProvider extends ChangeNotifier {
  // FavoritesProvider() {
   
  // }


  List<BookEntity> get favoritesList => favorites;

  bool isFavorite(BookEntity book) {
    return favorites.any((element) => element.bookId == book.bookId);
  }

  void toggleFavorite(BookEntity book) async {
    var box = await Hive.openBox<BookEntity>(kFavoriteBooks);

    if (isFavorite(book)) {
      favorites.removeWhere((element) => element.bookId == book.bookId);
      await box.delete(book.bookId); // احذف من Hive كمان
    } else {
      favorites.add(book);
      await box.put(book.bookId, book); // استخدم put مع مفتاح مميز
    }

    notifyListeners();
  }

  void getList() async {
    var box = await Hive.openBox<BookEntity>(kFavoriteBooks);
    favorites = box.values.toList();
    notifyListeners();
  }
}
