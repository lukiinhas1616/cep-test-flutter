import 'package:dartz/dartz.dart';

import '../../../../core/utils/failure/failure.dart';
import '../../domain/repositories/coordinator_repository.dart';

class CoordinatorRepositoryImp implements CoordinatorRepository {
  const CoordinatorRepositoryImp();

  @override
  Future<Either<Failure, bool>> getInitialRoute() async {
    try {
      // Adicionaria aqui alguma logica se necessario
      return const Right(true);
    } catch (exception) {
      return const Right(false);
    }
  }
}
