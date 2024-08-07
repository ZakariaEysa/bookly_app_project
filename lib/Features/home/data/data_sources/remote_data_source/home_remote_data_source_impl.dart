import 'package:bookly_app_project/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';

import '../../../../../core/utils/api_service.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=subject:flutter');
    List<BookModel> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=subject:computer science');
    List<BookModel> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchRelatedBooks({required String category}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Sorting=relevance&Filtering=free-ebooks&q=subject:$category');
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
