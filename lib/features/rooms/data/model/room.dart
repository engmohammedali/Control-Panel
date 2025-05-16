import 'package:controlpanel/features/Teachers/data/model/teacher.dart';
import 'package:controlpanel/features/lessons/data/model/lesson.dart';
import 'package:controlpanel/features/students/data/model/student.dart';

class Room {
  static int counter = 0;
  static int get nextId => counter++;
  final int id;
  final String name;
  Teacher? teacher;
  List<Student>? students;
  List<Lesson>? lessons;

  Room({
    required this.students,
    required this.id,
    required this.name,
    this.teacher,
    this.lessons,
  });
}
