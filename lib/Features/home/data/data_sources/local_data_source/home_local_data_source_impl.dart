import 'package:bookly_app_project/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchRelatedBooks({required String category}) {
    // TODO: implement fetchRelatedBooks
    throw UnimplementedError();
  }
}
