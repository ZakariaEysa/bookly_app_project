import '../entities/book_entity.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
     );
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks( {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchRelatedBooks(
      {required String category});
}
