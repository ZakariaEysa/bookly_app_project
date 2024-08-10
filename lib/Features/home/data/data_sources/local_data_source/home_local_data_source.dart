import '../../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchFeaturedBooks( {int pageNumber = 0});
  List<BookEntity> fetchRelatedBooks({required String category});
}
