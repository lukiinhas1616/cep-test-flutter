import 'package:dartz/dartz.dart';
import 'package:monetizze_app/core/utils/parameters/zero_parameters.dart';
import 'package:monetizze_app/modules/district/domain/repositories/district_repository.dart';

import '../../../../core/shared/domain/usecases/async_usecase.dart';
import '../../../../core/utils/failure/failure.dart';
import '../entities/district_entity.dart';

abstract class GetDistrictsUseCase
    extends AsyncUseCase<List<DistrictEntity>, ZeroParameters> {
  const GetDistrictsUseCase();
}

class GetDistrictsUseCaseImp extends GetDistrictsUseCase {
  final DistrictRepository _districtRepository;

  GetDistrictsUseCaseImp(
    this._districtRepository,
  );

  @override
  Future<Either<Failure, List<DistrictEntity>>> call(
      ZeroParameters parameters) async {
    try {
      return await _districtRepository.getDistricts(parameters);
    } catch (e) {
      return Left(Failure("Erro durante autenticação: $e"));
    }
  }
}
