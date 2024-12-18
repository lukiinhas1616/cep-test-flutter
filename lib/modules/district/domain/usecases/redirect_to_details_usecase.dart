import 'package:dartz/dartz.dart';
import 'package:monetizze_app/core/utils/failure/failure.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';

import '../../../../core/shared/domain/usecases/async_usecase.dart';

abstract class RedirectToDetailsUseCase
    extends AsyncUseCase<void, DistrictEntity> {
  const RedirectToDetailsUseCase();
}

class RedirectToDetailsUseCaseImp extends RedirectToDetailsUseCase {
  @override
  Future<Either<Failure, void>> call(DistrictEntity parameters) async {
    try {
      return const Right(null);
    } catch (e) {
      return Left(Failure("Erro ao redirecionar para detalhes: $e"));
    }
  }
}
