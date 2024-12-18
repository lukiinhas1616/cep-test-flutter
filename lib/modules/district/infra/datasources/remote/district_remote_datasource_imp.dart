import 'package:monetizze_app/core/utils/api_routes/api_routes.dart';
import 'package:monetizze_app/core/utils/parameters/zero_parameters.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';
import 'package:monetizze_app/modules/district/infra/dtos/district_dto.dart';

import '../../../../../core/shared/domain/services/http_service.dart';
import '../district_datasource.dart';

class DistrictRemoteDataSourceImp implements DistrictDataSource {
  final HttpService _httpService;

  DistrictRemoteDataSourceImp(this._httpService);

  @override
  Future<List<DistrictEntity>> getDistricts(ZeroParameters parameters) async {
    final response = await _httpService.get(
      ApiRoutes.getDistricts,
    );
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => DistrictDto.fromMap(e))
          .toList();
    } else {
      throw Exception("Erro ao buscar distritos");
    }
  }
}
