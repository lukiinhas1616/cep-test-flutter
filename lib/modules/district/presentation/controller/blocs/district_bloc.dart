import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:monetizze_app/modules/district/presentation/controller/events/district_events.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/error_on_get_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/fetching_districts_state.dart';
import 'package:monetizze_app/modules/district/presentation/controller/states/successfully_got_districts_state.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/shared/presentation/controller/states/idle_state.dart';
import '../../../../../core/utils/parameters/zero_parameters.dart';
import '../../../domain/usecases/get_districts_usecase.dart';
import '../events/fetch_districts_event.dart';

class DistrictBloc extends Bloc<DistrictEvents, AppState>
    implements Disposable {
  DistrictBloc(this._getDistrictsUseCase) : super(IdleState()) {
    on<GetDistrictsEvent>(_onFetchDistrictsEvent);
  }

  final GetDistrictsUseCase _getDistrictsUseCase;

  FutureOr<void> _onFetchDistrictsEvent(
    GetDistrictsEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(FetchingDistrictsState());
    final result = await _getDistrictsUseCase(const ZeroParameters());

    emit(
      result.fold(
        (failure) {
          return ErrorOnGetDistrictsState();
        },
        (success) {
          return SuccessfullyGotDistrictsState(districts: success);
        },
      ),
    );
  }

  @override
  void dispose() => close();
}
