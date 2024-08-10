import '../../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});

  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});

  List<BookEntity> fetchRelatedBooks({int pageNumber = 0});
}
