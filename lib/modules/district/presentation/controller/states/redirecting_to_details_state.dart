import 'package:equatable/equatable.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/utils/constants/global_state_constants.dart';
import '../../../domain/entities/district_entity.dart';

class RedirectingToDetailsState extends Equatable implements AppState {
  const RedirectingToDetailsState({required this.district});

  final DistrictEntity district;
  @override
  String get message => GlobalStateConstants.processingDataState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
