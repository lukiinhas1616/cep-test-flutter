import 'package:monetizze_app/modules/district/domain/entities/district_entity.dart';

import 'district_events.dart';

class RedirectToDetailsEvent implements DistrictEvents {
  const RedirectToDetailsEvent({required this.district});

  final DistrictEntity district;
}
