class Exercies {
  static int counter = 0;
  static int get nextId => counter++;
  final int id;
  final String title;
  final String description;
  Exercies({required this.id, required this.title, required this.description});
}
