class Student {
  static int counter = 0;
  static int get nextId => counter++;
  final int id;
  final int roomId;
  final String teacherName;
  final String className;
  final String name;
  final String img;

  Student({
    required this.img,
    required this.id,
    required this.name,
    required this.className,
    required this.teacherName,
    required this.roomId,
  });
}
