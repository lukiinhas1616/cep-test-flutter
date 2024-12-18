import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/shared/presentation/controller/states/idle_state.dart';
import '../../../../../core/shared/presentation/controller/states/loading_state.dart';
import '../../../../../core/utils/parameters/zero_parameters.dart';
import '../../../domain/usecases/get_initial_route_usecase.dart';
import '../events/coordinator_events.dart';
import '../events/get_initial_route_event.dart';
import '../states/error_on_get_initial_route_state.dart';
import '../states/successfully_got_initial_route_state.dart';

class CoordinatorBloc extends Bloc<CoordinatorEvents, AppState>
    implements Disposable {
  CoordinatorBloc(this._getInitialRouteUseCase) : super(IdleState()) {
    on<GetInitialRouteEvent>(_onGetInitialRouteEvent);
  }

  final GetInitialRouteUseCase _getInitialRouteUseCase;

  FutureOr<void> _onGetInitialRouteEvent(
    GetInitialRouteEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(LoadingState());
    final result = await _getInitialRouteUseCase(const ZeroParameters());
    emit(
      result.fold(
        (failure) => ErrorOnGetInitialRouteState(),
        (success) => const SuccessfullyGotInitialRouteState(),
      ),
    );
  }

  @override
  void dispose() => close();
}
