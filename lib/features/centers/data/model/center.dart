import 'package:controlpanel/features/rooms/data/model/room.dart';

class CenterModel {
  static int counter = 0;
  static int get nextId => counter++;
  final int id;
  final String name;
  late List<Room>? rooms;
  CenterModel({required this.id, required this.name, this.rooms});
}
