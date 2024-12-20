import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:monetizze_app/core/shared/presentation/controller/states/app_state.dart';
import 'package:monetizze_app/core/shared/presentation/controller/states/idle_state.dart';
import 'package:monetizze_app/core/utils/failure/failure.dart';
import 'package:monetizze_app/core/utils/parameters/zero_parameters.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';
import 'package:monetizze_app/modules/district/domain/usecases/get_districts_usecase.dart';
import 'package:monetizze_app/modules/district/presentation/controller/blocs/district_bloc.dart';
import 'package:monetizze_app/modules/district/presentation/controller/events/fetch_districts_event.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/error_on_get_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/fetching_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/successfully_got_districts_state.dart';

class MockGetDistrictsUseCase extends Mock implements GetDistrictsUseCase {}

void main() {
  late DistrictBloc districtBloc;
  late MockGetDistrictsUseCase mockGetDistrictsUseCase;

  setUp(() {
    mockGetDistrictsUseCase = MockGetDistrictsUseCase();
    districtBloc = DistrictBloc(mockGetDistrictsUseCase);
  });

  tearDown(() {
    districtBloc.close();
  });

  group('DistrictBloc', () {
    const district = DistrictEntity(
      municipalityName: '',
      stateName: '',
      stateAcronym: '',
      microRegionName: '',
      mesoRegionName: '',
      municipalityId: 1,
    );
    const districts = [district];

    test('estado inicial é IdleState', () {
      expect(districtBloc.state, isA<IdleState>());
    });

    blocTest<DistrictBloc, AppState>(
      'emite estado de sucesso quando distritos são carregados com sucesso',
      build: () {
        when(() => mockGetDistrictsUseCase.call(const ZeroParameters()))
            .thenAnswer(
          (_) async => const Right(districts),
        );
        return districtBloc;
      },
      act: (bloc) => bloc.add(const GetDistrictsEvent()),
      expect: () => [
        isA<FetchingDistrictsState>(),
        isA<SuccessfullyGotDistrictsState>(),
      ],
    );

    blocTest<DistrictBloc, AppState>(
      'emite estado de erro quando falhar ao carregar distritos',
      build: () {
        when(() => mockGetDistrictsUseCase.call(const ZeroParameters()))
            .thenAnswer(
          (_) async => const Left(Failure('Falha ao carregar distritos')),
        );
        return districtBloc;
      },
      act: (bloc) => bloc.add(const GetDistrictsEvent()),
      expect: () => [
        isA<FetchingDistrictsState>(),
        isA<ErrorOnGetDistrictsState>(),
      ],
    );
  });
}
