import 'package:controlpanel/features/centers/data/model/center.dart';

class Institute {
  static int counter = 0;
  static int get nextId => counter++;

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
