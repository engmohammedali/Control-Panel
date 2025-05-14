import 'package:controlpanel/core/routing/routes.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/data/model/classes.dart';
import 'package:controlpanel/data/model/stautant.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/view/centers_view.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/home/view/home_view.dart';
import 'package:controlpanel/features/room/logic/room_cubit.dart';
import 'package:controlpanel/features/room/view/rooms_view.dart';
import 'package:controlpanel/features/stautant/logic/staudant_cubit.dart';
import 'package:controlpanel/features/stautant/view/staudant_view.dart';
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
                child: const HomeView(),
              ),
        );

      case Routes.centers:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<CenterCubit>(),
                child: CentersView(centers: arguments as List<CenterModel>),
              ),
        );

      case Routes.room:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<RoomCubit>(),
                child: RoomsView(room: arguments as Room),
              ),
        );

      case Routes.staudant:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<StaudantCubit>(),
            child: StaudantView(students: arguments as List<Staudant>),
          ),
        );  
      default:
        return null;
    }
  }
}
