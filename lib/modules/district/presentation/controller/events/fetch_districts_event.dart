import 'package:monetizze_app/modules/district/presentation/controller/events/district_events.dart';

class GetDistrictsEvent implements DistrictEvents {
  const GetDistrictsEvent({
    this.forceRefresh = false,
    this.textFilter = '',
  });

  ///Se true, força a busca dos distritos via API
  ///Caso contrário, busca os distritos em cache
  final bool forceRefresh;
  final String textFilter;
}
