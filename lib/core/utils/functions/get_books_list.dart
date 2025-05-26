import '../../../Features/home/data/models/book_model/book_model.dart';

List<BookModel> getBooksList(Map<String, dynamic> data) {
  List<BookModel> books = [];
  if (data.containsKey('items')) {
    for (var book in data['items']) {
      var item = BookModel.fromJson(book);

      if (item.image != '') {
        books.add(BookModel.fromJson(book));
      }
    }
  }
  return books;
}
