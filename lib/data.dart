import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/data/model/classes.dart';
import 'package:controlpanel/data/model/institute.dart';
import 'package:controlpanel/data/model/stautant.dart';
import 'package:controlpanel/data/model/teacher.dart';

late final Room room1Instance;
late final Room room2Instance;
late final Teacher teacher1;
late final Teacher teacher2;
late final List<CenterModel> centers;
late final List<Institute> institutes;
late final List<Teacher> teachers;
late final List<Staudant> students;
late final List<Room> rooms;

void initializeData() {
  students = [
    Staudant(
      id: 1,
      name: 'omer',
      classId: 1,
      className: 'room 1',
      teacherName: 'saed',
    ),
    Staudant(
      id: 2,
      name: 'aya',
      classId: 2,
      className: 'room 2',
      teacherName: 'ahmad',
    ),

    Staudant(
      id: 2,
      name: 'aya',
      classId: 2,
      className: 'room 2',
      teacherName: 'ahmad',
    ),

    Staudant(
      id: 2,
      name: 'aya',
      classId: 2,
      className: 'room 2',
      teacherName: 'ahmad',
    ),
  ];

  room1Instance = Room(id: 1, name: 'room 1', students: students);
  room2Instance = Room(id: 2, name: 'room 2', students: students);

  teacher1 = Teacher(name: 'saed', room: room1Instance);
  teacher2 = Teacher(name: 'ahmad', room: room2Instance);

  room1Instance.teacher = teacher1;
  room2Instance.teacher = teacher2;

  centers = [
    CenterModel(name: 'mork', id: 1, room: room1Instance),
    CenterModel(name: 'omer', id: 2, room: room2Instance),
  ];

  institutes = [
    Institute(centers: centers, id: 1, name: 'hama', location: 'homs'),
  ];

  teachers = [teacher1, teacher2];
  rooms = [room1Instance, room2Instance];
}
