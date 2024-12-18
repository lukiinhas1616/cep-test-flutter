import 'package:equatable/equatable.dart';
import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/utils/constants/global_state_constants.dart';

class SuccessfullyGotDistrictsState extends Equatable implements AppState {
  const SuccessfullyGotDistrictsState({required this.districts});

  final List<DistrictEntity> districts;

  @override
  String get message => GlobalStateConstants.successfullyGotDataState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
