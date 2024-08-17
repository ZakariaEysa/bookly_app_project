import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<T, Param, String> {
  Future<Either<Failure, T>> call([Param param, String category]);
}

class NoParam {}
