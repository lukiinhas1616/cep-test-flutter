import 'package:equatable/equatable.dart';

class DistrictEntity extends Equatable {
  const DistrictEntity({
    required this.municipalityName,
    required this.stateName,
    required this.stateAcronym,
    required this.municipalityId,
    required this.microRegionName,
    required this.mesoRegionName,
  });

  final String municipalityName;
  final String stateName;
  final String stateAcronym;
  final int municipalityId;
  final String microRegionName;
  final String mesoRegionName;

  @override
  List<Object> get props => [
        municipalityName,
        stateName,
        stateAcronym,
        municipalityId,
        microRegionName,
        mesoRegionName,
      ];
}
