import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<T, Param, String, String2> {
  Future<Either<Failure, T>> call(
      [Param param, String category, String2 userQuery]);
}

class NoParam {}
