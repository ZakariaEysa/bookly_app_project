import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/book_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/local_data_source/home_local_data_source.dart';
import '../data_sources/remote_data_source/home_remote_data_source.dart';

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
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books;

    try {
      books = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);

      if (books.isNotEmpty) {
        return right(books);
      }

      books =
          await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);

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
