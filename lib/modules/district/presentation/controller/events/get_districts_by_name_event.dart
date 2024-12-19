import 'district_events.dart';

class GetDistrictsByNameEvent implements DistrictEvents {
  const GetDistrictsByNameEvent({this.text = ''});

  final String text;
}
