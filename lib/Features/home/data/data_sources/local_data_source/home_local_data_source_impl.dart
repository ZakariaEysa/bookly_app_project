import 'package:bookly_app_project/Features/home/data/data_sources/local_data_source/home_local_data_source.dart';
import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_project/constants.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    print(pageNumber);

    var box = Hive.box<BookEntity>(kFeaturedBooks);
    int length = box.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBooks);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchRelatedBooks({required String category}) {
    // TODO: implement fetchRelatedBooks
    throw UnimplementedError();
  }
}
