import 'package:controlpanel/core/routing/routes.dart';
import 'package:controlpanel/data/model/center.dart';
import 'package:controlpanel/features/centers/logic/center_cubit.dart';
import 'package:controlpanel/features/centers/view/centers_view.dart';
import 'package:controlpanel/features/home/logic/institute_bloc/institutes_cubit.dart';
import 'package:controlpanel/features/home/view/home_view.dart';
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
      default:
        return null;
    }
  }
}
