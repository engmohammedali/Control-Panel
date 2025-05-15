import 'package:controlpanel/features/centers/data/model/center.dart';
import 'package:controlpanel/features/dashboard/data/model/lesson.dart';

class Institute {
  static int counter = 0;
  static int get nextId => counter++;
  
  final int id;
  final String name;
  final String location;

  final List<CenterModel> centers;
  final List<Lesson> lessons;
  Institute({
    required this.centers,
    required this.id,
    required this.name,
    required this.location,
    required this.lessons,
  });
}
