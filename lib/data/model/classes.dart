import 'package:controlpanel/data/model/stautant.dart';
import 'package:controlpanel/data/model/teacher.dart';

class Room {
  final int id;
  final String name;
  Teacher? teacher;
  final List<Staudant> students;

  Room({
    required this.students,
    required this.id,
    required this.name,
    this.teacher,
  });
}
