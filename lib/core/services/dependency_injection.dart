import 'package:controlpanel/core/networking/dio_factory.dart';
import 'package:controlpanel/features/home/data/api_add_institutes.dart';
import 'package:controlpanel/features/home/data/api_get_institutes.dart';
import 'package:controlpanel/features/home/logic/institutes_bloc/institutes_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void setupGetIt() async {
    _setupHome();
  }

  _setupHome() {
    // bloc
    getIt.registerFactory(() => InstitutesCubit(getIt(), getIt()));
    // api
    getIt.registerLazySingleton<ApiGetInstitutes>(
      () => ApiGetInstitutes(dio: DioFactory.getDio()),
    );

    getIt.registerLazySingleton<ApiAddInstitutes>(
      () => ApiAddInstitutes(dio: DioFactory.getDio()),
    );
  }
}
