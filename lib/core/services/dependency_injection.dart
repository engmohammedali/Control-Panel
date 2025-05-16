import 'package:controlpanel/core/networking/dio_factory.dart';
import 'package:controlpanel/features/Teachers/data/api_add_teacher.dart';
import 'package:controlpanel/features/Teachers/data/api_get_teacher.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_cubit.dart';
import 'package:controlpanel/features/centers/data/api_add_center.dart';
import 'package:controlpanel/features/centers/data/api_get_center.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/dashboard/data/api_add_institute.dart';
import 'package:controlpanel/features/dashboard/data/api_get_institutes.dart';
import 'package:controlpanel/features/dashboard/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/exercieses/data/api_add_exercies.dart';
import 'package:controlpanel/features/exercieses/data/api_get_exercies.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_cubit.dart';
import 'package:controlpanel/features/lessons/data/api_add_lesson.dart';
import 'package:controlpanel/features/lessons/data/api_get_lessons.dart';
import 'package:controlpanel/features/lessons/logic/lesson_cubit.dart';
import 'package:controlpanel/features/rooms/data/api_add_room.dart';
import 'package:controlpanel/features/rooms/data/api_get_rooms.dart';
import 'package:controlpanel/features/rooms/logic/room_cubit.dart';
import 'package:controlpanel/features/students/data/api_add_student.dart';
import 'package:controlpanel/features/students/data/api_get_student.dart';
import 'package:controlpanel/features/students/logic/student_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void setupGetIt() async {
    _setupHome();
    _setUpCenter();
    _setUpRoom();
    _setUpStudentAndTeacher();
    _setUpExercies();
  }

  _setupHome() {
    // bloc
    getIt.registerFactory(() => InstitutesCubit(getIt(), getIt()));
    // api
    getIt.registerLazySingleton<ApiGetInstitutes>(
      () => ApiGetInstitutes(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddInstitute>(
      () => ApiAddInstitute(dio: DioFactory.getDio()),
    );
  }

  _setUpCenter() {
    getIt.registerFactory(() => CenterCubit(getIt(), getIt()));
    getIt.registerLazySingleton<ApiAddCenter>(
      () => ApiAddCenter(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiGetCenter>(
      () => ApiGetCenter(dio: DioFactory.getDio()),
    );
  }

  _setUpRoom() {
    // bloc
    getIt.registerFactory(() => RoomCubit(getIt(), getIt()));
    // api
    getIt.registerLazySingleton<ApiGetRooms>(
      () => ApiGetRooms(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddRoom>(
      () => ApiAddRoom(dio: DioFactory.getDio()),
    );
  }

  _setUpStudentAndTeacher() {
    getIt.registerFactory(() => StudentCubit(getIt(), getIt()));

    getIt.registerFactory(() => LessonCubit(getIt(), getIt()));

    getIt.registerFactory(() => TeacherCubit(getIt(), getIt()));
    getIt.registerLazySingleton<ApiGetStudent>(
      () => ApiGetStudent(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddStudent>(
      () => ApiAddStudent(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddTeacher>(
      () => ApiAddTeacher(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiGetTeacher>(
      () => ApiGetTeacher(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddLesson>(
      () => ApiAddLesson(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiGetLessons>(
      () => ApiGetLessons(dio: DioFactory.getDio()),
    );

    // getIt.registerLazySingleton<ApiGetStudent>(
  }

  _setUpExercies() {
    // bloc
    getIt.registerFactory(() => ExerciesCubit(getIt(), getIt()));
    // api
    getIt.registerLazySingleton<ApiGetExercies>(
      () => ApiGetExercies(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddExercies>(
      () => ApiAddExercies(dio: DioFactory.getDio()),
    );
  }
}
