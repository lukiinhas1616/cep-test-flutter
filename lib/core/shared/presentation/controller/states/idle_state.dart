import 'package:equatable/equatable.dart';

import '../../../../utils/constants/global_state_constants.dart';
import 'app_state.dart';

class IdleState extends Equatable implements AppState {
  @override
  String get message => GlobalStateConstants.idleState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
