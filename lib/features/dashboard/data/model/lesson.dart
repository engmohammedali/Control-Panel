class Lesson {
  static int counter = 0;
  static int get nextId => counter++;
  static int get nextLessonId => counter++;
  final int id;
  final String title;
  final String description;

  Lesson({required this.id, required this.title, required this.description});
}
