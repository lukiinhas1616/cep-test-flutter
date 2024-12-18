import 'package:dartz/dartz.dart';
import 'package:monetizze_app/core/utils/parameters/zero_parameters.dart';

import '../../../../core/utils/failure/failure.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/repositories/district_repository.dart';
import '../datasources/district_datasource.dart';

class DistrictRepositoryImp implements DistrictRepository {
  final DistrictDataSource _districtDataSource;
  DistrictRepositoryImp(this._districtDataSource);

  @override
  Future<Either<Failure, List<DistrictEntity>>> getDistricts(
    ZeroParameters parameters,
  ) async {
    try {
      final result = await _districtDataSource.getDistricts(parameters);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
