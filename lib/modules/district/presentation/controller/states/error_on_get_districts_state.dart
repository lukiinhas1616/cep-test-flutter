import 'package:equatable/equatable.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/utils/constants/global_state_constants.dart';

class ErrorOnGetDistrictsState extends Equatable implements AppState {
  const ErrorOnGetDistrictsState({
    this.message = GlobalStateConstants.errorOnGetDataState,
  });

  @override
  final String message;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
