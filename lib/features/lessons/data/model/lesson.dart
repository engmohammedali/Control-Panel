import 'package:controlpanel/features/exercieses/data/model/exercies.dart';

class Lesson {
  static int counter = 0;
  static int get nextId => counter++;
  static int get nextLessonId => counter++;
  final int id;
  final String title;
  final String description;
  final List<Exercies>? exercieses;

  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.exercieses,
  });
}
