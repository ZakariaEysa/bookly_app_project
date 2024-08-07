

import '../../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchRelatedBooks({required String category});
}

