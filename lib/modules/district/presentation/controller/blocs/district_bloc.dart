import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';
import 'package:monetizze_app/modules/district/presentation/controller/events/district_events.dart';
import 'package:monetizze_app/modules/district/presentation/controller/events/get_districts_by_filters_event.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/error_on_get_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/fetching_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/many_requests_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/successfully_got_districts_state.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/shared/presentation/controller/states/idle_state.dart';
import '../../../../../core/utils/parameters/zero_parameters.dart';
import '../../../domain/usecases/get_districts_usecase.dart';
import '../../ui/widgets/sort_bottomsheet_widget.dart';
import '../events/fetch_districts_event.dart';

class DistrictBloc extends Bloc<DistrictEvents, AppState>
    implements Disposable {
  DistrictBloc(
    this._getDistrictsUseCase,
  ) : super(IdleState()) {
    on<GetDistrictsEvent>(_onFetchDistrictsEvent);
    on<GetDistrictsByFiltersEvent>(_onFetchDistrictsByFiltersEvent);
  }

  final GetDistrictsUseCase _getDistrictsUseCase;

  var _cachedDistricts = <DistrictEntity>[];
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
            sortOption: SortOption.none,
          );
        },
      ),
    );
  }

  FutureOr<void> _onFetchDistrictsByFiltersEvent(
    GetDistrictsByFiltersEvent event,
    Emitter<AppState> emit,
  ) async {
    final filteredDistricts =
        _filterDistrictByText(_cachedDistricts, event.text);

    final sortedDistricts =
        _sortedDistricts(filteredDistricts, event.sortOption);
    emit(FetchingDistrictsState());
    emit(
      SuccessfullyGotDistrictsState(
        districts: sortedDistricts,
        sortOption: event.sortOption,
      ),
    );
  }

  _saveDistrictsInSession(List<DistrictEntity> districts) {
    _cachedDistricts = districts;
  }

  _filterDistrictByText(List<DistrictEntity> districts, String textFilter) {
    return districts
        .where((district) =>
            district.municipalityName.toLowerCase().contains(textFilter))
        .toList();
  }

  _sortedDistricts(List<DistrictEntity> districts, SortOption sortOption) {
    if (sortOption == SortOption.state) {
      districts.sort((a, b) => a.stateName.compareTo(b.stateName));
    }
    if (sortOption == SortOption.name) {
      districts
          .sort((a, b) => a.municipalityName.compareTo(b.municipalityName));
    }

    return districts;
  }

  @override
  void dispose() => close();
}
