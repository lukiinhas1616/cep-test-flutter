import 'package:dio/dio.dart';
import 'package:monetizze_app/core/utils/api_routes/api_routes.dart';
import 'package:monetizze_app/core/utils/exceptions_handler/dio_exceptions_handler.dart';
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
    try {
      final response = await _httpService.get(
        ApiRoutes.getDistricts,
      );
      return (response.data as List)
          .map((e) => DistrictDto.fromMap(e))
          .toList();
    } on DioException catch (e) {
      throw Exception(DioExceptionHandler.handleDioError(e));
    } on Exception catch (_) {
      throw Exception("Houve uma falha, Favor, contate o suporte!");
    }
  }
}
