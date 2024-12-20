import 'package:equatable/equatable.dart';
import 'package:monetizze_app/modules/district/presentation/ui/widgets/sort_bottomsheet_widget.dart';

import '../../../../../core/shared/presentation/controller/states/app_state.dart';
import '../../../../../core/utils/constants/global_state_constants.dart';
import '../../../domain/entities/district_entity.dart';

class SuccessfullyGotDistrictsState extends Equatable implements AppState {
  const SuccessfullyGotDistrictsState({
    required this.districts,
    this.lastRefresh,
    this.sortOption = SortOption.none,
  });

  final List<DistrictEntity> districts;
  final DateTime? lastRefresh;
  final SortOption sortOption;

  @override
  String get message => GlobalStateConstants.successfullyGotDataState;

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  bool? get stringify => true;
}
