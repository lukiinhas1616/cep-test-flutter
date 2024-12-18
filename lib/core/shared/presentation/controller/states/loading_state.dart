import 'package:equatable/equatable.dart';

import '../../../../utils/constants/global_state_constants.dart';
import 'app_state.dart';

class LoadingState extends Equatable implements AppState {
  @override
  String get message => GlobalStateConstants.fetchingDataState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
