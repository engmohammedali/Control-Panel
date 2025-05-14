import 'package:controlpanel/data/model/classes.dart';

class CenterModel {
  final int id;
  final String name;
  final Room? room;

  CenterModel({required this.id, required this.name, this.room,});
}
