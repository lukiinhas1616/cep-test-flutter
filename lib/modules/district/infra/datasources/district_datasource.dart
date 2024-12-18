import 'package:monetizze_app/core/utils/parameters/zero_parameters.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';

abstract class DistrictDataSource {
  Future<List<DistrictEntity>> getDistricts(
    ZeroParameters parameters,
  );
}
