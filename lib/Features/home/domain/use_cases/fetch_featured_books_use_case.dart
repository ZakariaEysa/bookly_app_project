import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int, String> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(
    this.homeRepo,
  );

  @override
  Future<Either<Failure, List<BookEntity>>> call([
    int param = 0,
    String category = 'programming',
  ]) async {
    // has permission ?
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}
