import 'package:controlpanel/features/Teachers/data/model/teacher.dart';
import 'package:controlpanel/features/centers/data/model/center.dart';
import 'package:controlpanel/features/dashboard/data/model/institute.dart';
import 'package:controlpanel/features/exercieses/data/model/exercies.dart';
import 'package:controlpanel/features/lessons/data/model/lesson.dart';
import 'package:controlpanel/features/rooms/data/model/room.dart';
import 'package:controlpanel/features/students/data/model/student.dart';

late final Room room1Instance;
late final Room room2Instance;
late final Teacher teacher1;
late final Teacher teacher2;
late final List<CenterModel> centers;
late final List<Institute> institutes;
late final List<Teacher> teachers;
late final List<Student> students;
late final List<Room> rooms;
late final List<Lesson> lessons;

void initializeData() {
  final Exercies exercies1 = Exercies(
    id: Exercies.nextId,
    title: 'exercies 1',
    description: 'description 1',
  );
  final Exercies exercies2 = Exercies(
    id: Exercies.nextId,
    title: 'exercies 2',
    description: 'description 2',
  );

  final lesson1 = Lesson(
    id: Lesson.nextId,
    description: 'description',
    title: 'title1',
    exercieses: [exercies1, exercies2],
  );

  final lesson2 = Lesson(
    id: Lesson.nextId,
    description: 'description',
    title: 'title2',
    exercieses: [exercies1, exercies2],
  );

  final Lesson lesson3 = Lesson(
    id: Lesson.nextId,
    description: 'description',
    title: 'title3',
    exercieses: [],
  );

  final Lesson lesson4 = Lesson(
    id: Lesson.nextId,
    description: 'description',
    title: 'title4',
    exercieses: [],
  );

  lessons = [lesson1, lesson2, lesson3, lesson4];

  students = [
    Student(
      id: Student.nextId,
      name: 'omer',
      className: 'room 1',
      teacherName: 'saed',
      img: 'assets/imgs/profile.png',
      roomId: 1,
    ),
    Student(
      id: Student.nextId,
      name: 'aya',
      className: 'room 2',
      teacherName: 'ahmad',
      img: 'assets/imgs/profile.png',
      roomId: 1,
    ),

    Student(
      id: Student.nextId,
      name: 'aya',
      className: 'room 2',
      teacherName: 'ahmad',
      img: 'assets/imgs/profile.png',
      roomId: 1,
    ),

    Student(
      id: Student.nextId,
      name: 'aya',
      className: 'room 2',
      teacherName: 'ahmad',
      img: 'assets/imgs/profile.png',
      roomId: 1,
    ),
  ];

  room1Instance = Room(id: Room.nextId, name: 'room 1', students: students);
  room2Instance = Room(id: Room.nextId, name: 'room 2', students: students);

  teacher1 = Teacher(
    name: 'saed',
    room: room1Instance,
    id: Teacher.nextId,
    img: 'assets/imgs/profile.png',
  );
  teacher2 = Teacher(
    name: 'ahmad',
    room: room2Instance,
    id: Teacher.nextId,
    img: 'assets/imgs/profile.png',
  );

  room1Instance.teacher = teacher1;
  room1Instance.lessons = [lesson1, lesson2];
  room2Instance.teacher = teacher2;

  centers = [
    CenterModel(name: 'mork', id: CenterModel.nextId, rooms: [room1Instance]),
    CenterModel(name: 'omer', id: CenterModel.nextId, rooms: [room2Instance]),
  ];

  institutes = [
    Institute(
      centers: centers,
      id: Institute.nextId,
      name: 'hama',
      location: 'homs',
    ),
  ];

  teachers = [teacher1, teacher2];
  rooms = [room1Instance];
}
