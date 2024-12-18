import 'package:equatable/equatable.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/utils/constants/global_state_constants.dart';
import '../../../domain/entities/district_entity.dart';

class SuccessfullyGotDistrictsState extends Equatable implements AppState {
  const SuccessfullyGotDistrictsState({
    required this.districts,
    this.lastRefresh,
  });

  final List<DistrictEntity> districts;
  final DateTime? lastRefresh;

  @override
  String get message => GlobalStateConstants.successfullyGotDataState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
