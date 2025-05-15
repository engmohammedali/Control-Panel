import 'package:controlpanel/core/routing/routes.dart';
import 'package:controlpanel/features/Teachers/logic/teacher_cubit.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/view/centers_view.dart';
import 'package:controlpanel/features/dashboard/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/dashboard/view/dashborad_view.dart';
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
      case Routes.home:
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
                        getIt<CenterCubit>()
                          ..fetchCentersCubit(arguments as int),
                child: CentersView(instituteId: arguments as int),
              ),
        );

      case Routes.room:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<RoomCubit>()..fetchRoomsCubit(
                          instituteId: (arguments as List<dynamic>)[0] as int,

                          centerId: (arguments as List<dynamic>)[1] as int,
                        ),
                child: RoomsView(
                  instituteId: (arguments as List<dynamic>)[0] as int,
                  centerId: (arguments as List<dynamic>)[1] as int,
                ),
              ),
        );

      case Routes.student:
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
                              centerId: (arguments as List<dynamic>)[1] as int,
                              roomId: (arguments as List<dynamic>)[2] as int,
                            ),
                  ),

                  BlocProvider(
                    create:
                        (context) =>
                            getIt<TeacherCubit>()..fetchTeachersCubit(
                              instituteId:
                                  (arguments as List<dynamic>)[0] as int,
                              centerId: (arguments as List<dynamic>)[1] as int,
                              roomId: (arguments as List<dynamic>)[2] as int,
                            ),
                  ),
                ],
                child: StudentView(
                  instituteId: (arguments as List<dynamic>)[0] as int,
                  centerId: (arguments as List<dynamic>)[1] as int,
                  roomId: (arguments as List<dynamic>)[2] as int,
                ),
              ),
        );
      default:
        return null;
    }
  }
}
