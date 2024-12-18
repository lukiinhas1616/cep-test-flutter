import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure/failure.dart';

abstract class CoordinatorRepository {
  const CoordinatorRepository();

  Future<Either<Failure, bool>> getInitialRoute();
}
