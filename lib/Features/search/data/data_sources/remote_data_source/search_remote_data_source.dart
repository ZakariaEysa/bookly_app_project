import '../../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchedBooks(
      {int pageNumber = 0, required String userQuery});
}
