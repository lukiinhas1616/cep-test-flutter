import 'package:dartz/dartz.dart';
import 'package:monetizze_app/core/utils/parameters/zero_parameters.dart';

import '../../../../core/utils/failure/failure.dart';
import '../entities/district_entity.dart';

abstract class DistrictRepository {
  Future<Either<Failure, List<DistrictEntity>>> getDistricts(
    ZeroParameters zeroParameters,
  );
}
