import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';

class DistrictDto {
  static DistrictEntity fromMap(Map<String, dynamic> json) {
    final municipality = json['municipio'] as Map<String, dynamic>;
    final microRegion = municipality['microrregiao'] as Map<String, dynamic>;
    final mesoRegion = microRegion['mesorregiao'] as Map<String, dynamic>;
    final state = mesoRegion['UF'] as Map<String, dynamic>;

    return DistrictEntity(
      municipalityId: json['id'] as int,
      municipalityName: json['nome'] as String,
      stateAcronym: state['sigla'] as String,
      stateName: state['nome'] as String,
      microRegionName: microRegion['nome'] as String,
      mesoRegionName: mesoRegion['nome'] as String,
    );
  }
}
