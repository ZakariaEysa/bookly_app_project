import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';

class FetchRelatedBooksUseCase extends UseCase<List<BookEntity>, int, String> {
  final HomeRepo homeRepo;

  FetchRelatedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int param = 0, String category = 'programming']) async {
    return await homeRepo.fetchRelatedBooks(
        category: category, pageNumber: param);
  }
}
