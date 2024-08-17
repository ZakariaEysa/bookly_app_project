import 'package:bookly_app_project/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../repos/search_repo.dart';

class FetchSearchedBooksUseCase
    extends UseCase<List<BookEntity>, int, String, String> {
  final SearchRepo searchRepo;

  FetchSearchedBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      [int param = 0,
      String category = 'programming',
      String userQuery = ""]) async {
    return await searchRepo.fetchSearchedBooks(userQuery: userQuery);
  }
}
