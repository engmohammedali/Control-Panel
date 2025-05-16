import 'package:controlpanel/core/routing/routes.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_cubit.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/view/centers_view.dart';
import 'package:controlpanel/features/dashboard/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/dashboard/view/dashborad_view.dart';
import 'package:controlpanel/features/exercieses/logic/exercies_cubit.dart';
import 'package:controlpanel/features/exercieses/view/exercies_view.dart';
import 'package:controlpanel/features/lessons/logic/lesson_cubit.dart';
import 'package:controlpanel/features/lessons/view/widgets/lesson_builder_widget.dart';
import 'package:controlpanel/features/rooms/logic/room_cubit.dart';
import 'package:controlpanel/features/rooms/view/rooms_view.dart';
import 'package:controlpanel/features/students/logic/student_cubit.dart';
import 'package:controlpanel/features/students/view/student_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<InstitutesCubit>()..feathInstitutesCubit(),
                child: const DashboardView(),
              ),
        );

      case Routes.centers:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<CenterCubit>()..fetchCentersCubit(arguments),
                child: CentersView(instituteId: arguments as int),
              ),
        );

      case Routes.rooms:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<RoomCubit>()..fetchRoomsCubit(
                          instituteId: (arguments)[0] as int,

                          centerId: (arguments)[1] as int,
                        ),
                child: RoomsView(
                  instituteId: (arguments as List<dynamic>)[0] as int,
                  centerId: (arguments)[1] as int,
                ),
              ),
        );

      case Routes.lessons:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<LessonCubit>()..fetchLessonsCubit(
                          instituteId: (arguments)[0] as int,

                          centerId: (arguments)[1] as int,

                          roomId: (arguments)[2] as int,
                        ),
                child: LessonBuilderWidget(
                  instituteId: (arguments as List<dynamic>)[0] as int,
                  centerId: (arguments)[1] as int,
                  roomId: (arguments)[2] as int,
                ),
              ),
        );

      case Routes.lessonDetails:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<ExerciesCubit>()..fetchExerciesCubit(
                          instituteId: (arguments as List<dynamic>)[0] as int,

                          centerId: (arguments)[1] as int,

                          roomId: (arguments)[2] as int,
                          lessonId: (arguments)[3] as int,
                        ),
                child: ExerciesView(
                  instituteId: (arguments as List<dynamic>)[0] as int,

                  centerId: (arguments)[1] as int,

                  roomId: (arguments)[2] as int,
                  lessonId: (arguments)[3] as int,
                ),
              ),
        );

      case Routes.students:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (context) =>
                            getIt<StudentCubit>()..fetchStudentsCubit(
                              instituteId:
                                  (arguments as List<dynamic>)[0] as int,
                              centerId: (arguments)[1] as int,
                              roomId: (arguments)[2] as int,
                            ),
                  ),

                  BlocProvider(
                    create:
                        (context) =>
                            getIt<LessonCubit>()..fetchLessonsCubit(
                              instituteId:
                                  (arguments as List<dynamic>)[0] as int,
                              centerId: (arguments)[1] as int,
                              roomId: (arguments)[2] as int,
                            ),
                  ),

                  BlocProvider(
                    create:
                        (context) =>
                            getIt<TeacherCubit>()..fetchTeachersCubit(
                              instituteId:
                                  (arguments as List<dynamic>)[0] as int,
                              centerId: (arguments)[1] as int,
                              roomId: (arguments)[2] as int,
                            ),
                  ),
                ],
                child: StudentView(
                  instituteId: (arguments as List<dynamic>)[0] as int,
                  centerId: (arguments)[1] as int,
                  roomId: (arguments)[2] as int,
                ),
              ),
        );
      default:
        return null;
    }
  }
}
