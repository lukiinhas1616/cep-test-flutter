import 'package:equatable/equatable.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/utils/constants/global_state_constants.dart';

class SuccessfullyGotInitialRouteState extends Equatable implements AppState {
  const SuccessfullyGotInitialRouteState();

  @override
  String get message => GlobalStateConstants.successfullyGotDataState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
