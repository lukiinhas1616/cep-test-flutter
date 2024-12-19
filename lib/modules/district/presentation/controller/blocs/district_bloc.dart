import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';
import 'package:monetizze_app/modules/district/presentation/controller/events/district_events.dart';
import 'package:monetizze_app/modules/district/presentation/controller/events/get_districts_by_name_event.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/error_on_get_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/fetching_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/many_requests_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/redirecting_to_details_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/successfully_got_districts_state.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/shared/presentation/controller/states/idle_state.dart';
import '../../../../../core/utils/parameters/zero_parameters.dart';
import '../../../domain/usecases/get_districts_usecase.dart';
import '../events/fetch_districts_event.dart';
import '../events/redirect_to_details_event.dart';

class DistrictBloc extends Bloc<DistrictEvents, AppState>
    implements Disposable {
  DistrictBloc(
    this._getDistrictsUseCase,
  ) : super(IdleState()) {
    on<GetDistrictsEvent>(_onFetchDistrictsEvent);
    on<RedirectToDetailsEvent>(_onRedirectToDetailsEvent);
    on<GetDistrictsByNameEvent>(_onFetchDistrictsByNameEvent);
  }

  final GetDistrictsUseCase _getDistrictsUseCase;

  final _cachedDistricts = <DistrictEntity>[];
  DateTime _lastRefresh = DateTime.now();

  FutureOr<void> _onFetchDistrictsEvent(
    GetDistrictsEvent event,
    Emitter<AppState> emit,
  ) async {
    final timeSinceLastRefresh = DateTime.now().difference(_lastRefresh);
    final timeSinceLastRefreshInSeconds = timeSinceLastRefresh.inSeconds;

    if (_cachedDistricts.isNotEmpty && timeSinceLastRefreshInSeconds < 10) {
      emit(ManyRequestsState());
      emit(SuccessfullyGotDistrictsState(districts: _cachedDistricts));
      return;
    }

    emit(FetchingDistrictsState());
    final result = await _getDistrictsUseCase(const ZeroParameters());
    emit(
      result.fold(
        (failure) {
          return ErrorOnGetDistrictsState(message: failure.message!);
        },
        (success) {
          _saveDistrictsInSession(success);
          _lastRefresh = DateTime.now();
          return SuccessfullyGotDistrictsState(
            districts: _cachedDistricts,
            lastRefresh: DateTime.now(),
          );
        },
      ),
    );
  }

  FutureOr<void> _onFetchDistrictsByNameEvent(
    GetDistrictsByNameEvent event,
    Emitter<AppState> emit,
  ) async {
    final sortedDistricts = _filterDistrictByText(_cachedDistricts, event.text);
    emit(FetchingDistrictsState());
    emit(
      SuccessfullyGotDistrictsState(districts: sortedDistricts),
    );
  }

  FutureOr<void> _onRedirectToDetailsEvent(
    RedirectToDetailsEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(
      RedirectingToDetailsState(district: event.district),
    );
    emit(
      SuccessfullyGotDistrictsState(districts: _cachedDistricts),
    );
  }

  _saveDistrictsInSession(List<DistrictEntity> districts) {
    _cachedDistricts.clear();
    _cachedDistricts.addAll(districts);
  }

  _filterDistrictByText(List<DistrictEntity> districts, String textFilter) {
    return districts
        .where((district) =>
            district.municipalityName.toLowerCase().contains(textFilter))
        .toList();
  }

  @override
  void dispose() => close();
}
