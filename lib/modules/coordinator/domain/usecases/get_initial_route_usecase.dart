import 'package:dartz/dartz.dart';

import '../../../../core/shared/domain/usecases/async_usecase.dart';
import '../../../../core/utils/failure/failure.dart';
import '../../../../core/utils/parameters/zero_parameters.dart';
import '../repositories/coordinator_repository.dart';

abstract class GetInitialRouteUseCase
    extends AsyncUseCase<bool, ZeroParameters> {
  const GetInitialRouteUseCase();
}

class GetInitialRouteUseCaseImp implements GetInitialRouteUseCase {
  const GetInitialRouteUseCaseImp(this.repository);

  final CoordinatorRepository repository;

  @override
  Future<Either<Failure, bool>> call(ZeroParameters parameters) async {
    try {
      return await repository.getInitialRoute();
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }
}
