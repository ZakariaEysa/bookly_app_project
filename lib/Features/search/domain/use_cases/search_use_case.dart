import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class SearchUseCase<T, Param, String> {
  Future<Either<Failure, T>> call([Param param, String userQuery]);
}

class NoParam {}
