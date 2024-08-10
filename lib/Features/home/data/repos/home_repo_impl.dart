import '../data_sources/local_data_source/home_local_data_source.dart';
import '../data_sources/remote_data_source/home_remote_data_source.dart';
import '../models/book_model/book_model.dart';
import '../../domain/entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);

      if (books.isNotEmpty) {
        return right(books);
      }

      books =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> books;

    try {
      books = homeLocalDataSource.fetchNewestBooks();

      if (books.isNotEmpty) {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchNewestBooks();

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchRelatedBooks(
      {required String category}) {
    // TODO: implement fetchRelatedBooks
    throw UnimplementedError();
  }
}
