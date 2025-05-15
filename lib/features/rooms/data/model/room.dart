import 'package:controlpanel/features/students/data/model/student.dart';
import 'package:controlpanel/features/Teachers/data/model/teacher.dart';

class Room {
  static int counter = 0;
  static int get nextId => counter++;
  final int id;
  final String name;
  Teacher? teacher;
  final List<Student>? students;

  Room({
    required this.students,
    required this.id,
    required this.name,
    this.teacher,
  });
}
