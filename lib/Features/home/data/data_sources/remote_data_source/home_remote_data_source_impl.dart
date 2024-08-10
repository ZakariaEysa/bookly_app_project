import '../../../../../constants.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/functions/save_box_data.dart';
import '../../../domain/entities/book_entity.dart';
import '../../models/book_model/book_model.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    int index = pageNumber * 10;
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=subject:programming&startIndex=$index');
    List<BookModel> books = getBooksList(data);
    await saveBoxData(books, kFeaturedBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    int index = pageNumber * 10;

    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science&startIndex=$index');
    List<BookModel> books = getBooksList(data);
    await saveBoxData(books, kNewestBooks);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchRelatedBooks(
      {required String category, int pageNumber = 0}) async {
    int index = pageNumber * 10;
    var data = await apiService.get(
        endPoint:
            'volumes?Sorting=relevance&Filtering=free-ebooks&q=subject:$category&startIndex=$index');
    List<BookModel> books = getBooksList(data);
    return books;
  }

  List<BookModel> getBooksList(Map<String, dynamic> data) {
    List<BookModel> books = [];
    for (var book in data['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
