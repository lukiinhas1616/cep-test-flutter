import 'package:equatable/equatable.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/utils/constants/global_state_constants.dart';

class FetchingDistrictsState extends Equatable implements AppState {
  @override
  String get message => GlobalStateConstants.fetchingDataState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
