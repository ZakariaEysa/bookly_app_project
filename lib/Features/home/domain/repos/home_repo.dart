import 'package:bookly_app_project/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_project/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
     );
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks( {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchRelatedBooks(
      {required String category});
}
