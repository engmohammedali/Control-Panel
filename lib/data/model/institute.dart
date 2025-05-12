import 'package:controlpanel/data/model/center.dart';

class Institute {
  final int id;
  final String name;
  final String location;

  final List<CenterModel> centers;
  Institute({
    required this.centers,
    required this.id,
    required this.name,
    required this.location,
  });
}
