import 'package:bookly_app_project/Features/search/domain/use_cases/search_use_case.dart';
import 'package:bookly_app_project/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../home/domain/entities/book_entity.dart';
import '../repos/search_repo.dart';

class FetchSearchedBooksUseCase
    extends SearchUseCase<List<BookEntity>, int, String> {
  final SearchRepo searchRepo;

  FetchSearchedBooksUseCase(this.searchRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([
    int param = 0,
    String userQuery = '',
  ]) async {
    return await searchRepo.fetchSearchedBooks(
        userQuery: userQuery, pageNumber: param);
  }
}
