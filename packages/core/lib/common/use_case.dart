import 'package:dartz/dartz.dart';

import '../network/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {

}