import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monetizze_app/core/utils/parameters/zero_parameters.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';
import 'package:monetizze_app/modules/district/domain/repositories/district_repository.dart';
import 'package:monetizze_app/modules/district/domain/usecases/get_districts_usecase.dart';

class MockDistrictRepository extends Mock implements DistrictRepository {}

void main() {
  late MockDistrictRepository mockAuthRepository;
  late GetDistrictsUseCaseImp useCase;

  setUp(() {
    mockAuthRepository = MockDistrictRepository();
    useCase = GetDistrictsUseCaseImp(
      mockAuthRepository,
    );
  });

  group('Verificar districts', () {
    test('Deve retornar um Right', () async {
      when(() => mockAuthRepository.getDistricts(const ZeroParameters()))
          .thenAnswer((_) async => Right(List<DistrictEntity>.empty()));
      final result = await useCase.call(const ZeroParameters());
      expect(result, isA<Right>());
    });

    test('Deve retornar um Left', () async {
      when(() => mockAuthRepository.getDistricts(const ZeroParameters()))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: ""),
        response: Response(
          requestOptions: RequestOptions(path: ""),
          statusCode: 404,
          statusMessage: "Erro de rede",
        ),
      ));

      final result = await useCase.call(const ZeroParameters());
      expect(result, isA<Left>());
    });
  });
}
