import 'package:monetizze_app/modules/district/presentation/ui/widgets/sort_bottomsheet_widget.dart';

import 'district_events.dart';

class GetDistrictsByFiltersEvent implements DistrictEvents {
  GetDistrictsByFiltersEvent({
    this.text = '',
    this.sortOption = SortOption.none,
  });

  final String text;
  SortOption sortOption;
}
