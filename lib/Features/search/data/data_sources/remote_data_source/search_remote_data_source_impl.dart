import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_project/Features/search/data/data_sources/remote_data_source/search_remote_data_source.dart';
import 'package:bookly_app_project/core/utils/api_service.dart';

import '../../../../../core/utils/functions/get_books_list.dart';
import '../../../../home/data/models/book_model/book_model.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchSearchedBooks(
      {int pageNumber = 0, required String userQuery}) async {
    int index = pageNumber * 10;
    var data = await apiService.get(
        endPoint: 'volumes?q=$userQuery&startIndex=$index');
    List<BookModel> books = getBooksList(data);

    return books;
  }
}
