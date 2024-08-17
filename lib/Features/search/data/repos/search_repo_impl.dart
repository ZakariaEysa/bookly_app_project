import 'package:bookly_app_project/Features/search/data/data_sources/remote_data_source/search_remote_data_source.dart';
import 'package:bookly_app_project/Features/search/domain/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/book_entity.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});

  Future<Either<Failure, List<BookEntity>>> fetchSearchedBooks(
      {int pageNumber = 0, required String userQuery}) async {
    List<BookEntity> books;
    try {
      books = await searchRemoteDataSource.fetchSearchedBooks(
          pageNumber: pageNumber, userQuery: userQuery);

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
