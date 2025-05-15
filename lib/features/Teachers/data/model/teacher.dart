import 'package:controlpanel/features/rooms/data/model/room.dart';

class Teacher {
  static int counter = 0;
  static int get nextId => counter++;
  final String name;
  final int id;
  final String img;
  final Room? room;
  Teacher({required this.name, required this.id, required this.img, this.room});
}
